use std::fs;

use zed_extension_api::{
    self as zed, serde_json, settings::LspSettings, Architecture, DownloadedFileType,
    GithubReleaseOptions, LanguageServerId, LanguageServerInstallationStatus, Os, Result,
};

/// Name of the executable on `PATH`, and the key of the server's entry under `lsp` in settings.
const SERVER_NAME: &str = "sysml-lsp";
const RELEASE_REPOSITORY: &str = "Open-MBEE/OpenSysML";

struct OpenSysmlExtension {
    /// Path of the downloaded server, kept so that only the first server start of a session asks
    /// GitHub for the latest release.
    cached_binary_path: Option<String>,
}

impl OpenSysmlExtension {
    /// Returns the server to run: the one on the worktree's `PATH`, otherwise the latest stable
    /// release, downloaded into the extension's working directory.
    fn server_binary_path(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<String> {
        if let Some(path) = worktree.which(SERVER_NAME) {
            return Ok(path);
        }

        if let Some(path) = &self.cached_binary_path {
            if is_file(path) {
                return Ok(path.clone());
            }
        }

        let (os, arch) = zed::current_platform();
        let target = release_target(os, arch)?;
        // Each release archive holds one executable, named after its platform.
        let binary_name = match os {
            Os::Windows => format!("{SERVER_NAME}-{target}.exe"),
            Os::Mac | Os::Linux => format!("{SERVER_NAME}-{target}"),
        };

        zed::set_language_server_installation_status(
            language_server_id,
            &LanguageServerInstallationStatus::CheckingForUpdate,
        );
        let release = match zed::latest_github_release(
            RELEASE_REPOSITORY,
            GithubReleaseOptions {
                require_assets: true,
                pre_release: false,
            },
        ) {
            Ok(release) => release,
            // Without network access, keep using the release downloaded earlier.
            Err(error) => {
                let binary_path = downloaded_binary_path(&binary_name).ok_or(error)?;
                self.cached_binary_path = Some(binary_path.clone());
                return Ok(binary_path);
            }
        };

        let version_dir = format!("{SERVER_NAME}-{}", release.version);
        let binary_path = format!("{version_dir}/{binary_name}");

        if !is_file(&binary_path) {
            let (archive_name, archive_type) = match os {
                Os::Windows => (
                    format!("{SERVER_NAME}-{target}.zip"),
                    DownloadedFileType::Zip,
                ),
                Os::Mac | Os::Linux => (
                    format!("{SERVER_NAME}-{target}.tar.gz"),
                    DownloadedFileType::GzipTar,
                ),
            };
            let asset = release
                .assets
                .iter()
                .find(|asset| asset.name == archive_name)
                .ok_or_else(|| {
                    format!(
                        "release {} of {RELEASE_REPOSITORY} has no asset named {archive_name}",
                        release.version
                    )
                })?;

            zed::set_language_server_installation_status(
                language_server_id,
                &LanguageServerInstallationStatus::Downloading,
            );
            zed::download_file(&asset.download_url, &version_dir, archive_type)
                .map_err(|error| format!("failed to download {archive_name}: {error}"))?;
            zed::make_file_executable(&binary_path)?;

            remove_other_versions(&version_dir);
        }

        self.cached_binary_path = Some(binary_path.clone());
        Ok(binary_path)
    }
}

impl zed::Extension for OpenSysmlExtension {
    fn new() -> Self {
        Self {
            cached_binary_path: None,
        }
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: self.server_binary_path(language_server_id, worktree)?,
            args: Vec::new(),
            env: Vec::new(),
        })
    }

    /// Forwards `lsp.sysml-lsp.settings` to the server, which reads its options from
    /// `workspace/didChangeConfiguration`.
    fn language_server_workspace_configuration(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<Option<serde_json::Value>> {
        Ok(LspSettings::for_worktree(SERVER_NAME, worktree)
            .ok()
            .and_then(|lsp_settings| lsp_settings.settings))
    }
}

/// Returns the platform part of the release asset names, such as `darwin-arm64`.
fn release_target(os: Os, arch: Architecture) -> Result<&'static str> {
    match (os, arch) {
        (Os::Mac, Architecture::Aarch64) => Ok("darwin-arm64"),
        (Os::Mac, Architecture::X8664) => Ok("darwin-amd64"),
        (Os::Linux, Architecture::Aarch64) => Ok("linux-arm64"),
        (Os::Linux, Architecture::X8664) => Ok("linux-amd64"),
        (Os::Windows, Architecture::X8664) => Ok("windows-amd64"),
        _ => Err(format!(
            "OpenSysML publishes no {SERVER_NAME} build for this platform. Install \
             {SERVER_NAME} and put it on PATH, or set lsp.{SERVER_NAME}.binary.path in settings."
        )),
    }
}

/// Finds a server left in the working directory by an earlier download.
fn downloaded_binary_path(binary_name: &str) -> Option<String> {
    fs::read_dir(".")
        .ok()?
        .flatten()
        .filter_map(|entry| entry.file_name().into_string().ok())
        .map(|version_dir| format!("{version_dir}/{binary_name}"))
        .find(|binary_path| is_file(binary_path))
}

/// Deletes everything in the working directory except `version_dir`, so that superseded
/// releases do not accumulate.
fn remove_other_versions(version_dir: &str) {
    let Ok(entries) = fs::read_dir(".") else {
        return;
    };
    for entry in entries.flatten() {
        if entry.file_name().to_str() != Some(version_dir) {
            fs::remove_dir_all(entry.path()).ok();
        }
    }
}

fn is_file(path: &str) -> bool {
    fs::metadata(path).is_ok_and(|metadata| metadata.is_file())
}

zed::register_extension!(OpenSysmlExtension);
