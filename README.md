# OpenSysML for Zed

SysML v2 and KerML support for [Zed](https://zed.dev), built on [OpenSysML](https://github.com/Open-MBEE/OpenSysML).

- **Editing support from Tree-sitter** for `.sysml` and `.kerml` files: syntax highlighting, bracket matching, auto-indentation, the outline panel and breadcrumbs, and Vim text objects. The parsers are the [tree-sitter-sysml](https://github.com/Open-MBEE/tree-sitter-sysml) grammars.
- **Language intelligence from `sysml-lsp`**, the OpenSysML language server: diagnostics, completion, hover, signature help, go to definition, find references, rename, document and workspace symbols, code actions, formatting, inlay hints and semantic tokens.

## Installation

Clone this repository, run `zed: install dev extension` from the command palette and select the cloned directory. Zed compiles the extension on installation, which requires a Rust toolchain installed through [rustup](https://rustup.rs).

## Language server

The extension starts `sysml-lsp` when you open a SysML or KerML file. It runs the first server it finds:

1. `sysml-lsp` on your `PATH`, as installed by any method in the [OpenSysML install guide](https://runtime.opensysml.org/guide/01-install/).
2. The latest stable OpenSysML release, downloaded from GitHub the first time it is needed. Releases provide the server for macOS and Linux on x86-64 and ARM64, and for Windows on x86-64. The extension looks for a newer release once per Zed session and keeps using the downloaded one when GitHub cannot be reached.

To run a particular build instead, or to pass command-line flags, set the server's `binary` in your Zed settings:

```json
{
  "lsp": {
    "sysml-lsp": {
      "binary": {
        "path": "/path/to/sysml-lsp",
        "arguments": ["-strict"]
      }
    }
  }
}
```

### Server settings

Options under `lsp.sysml-lsp.settings` are sent to the server, and a change takes effect without restarting it:

```json
{
  "lsp": {
    "sysml-lsp": {
      "settings": {
        "sysml": {
          "strictConformance": true,
          "keepLineBreaks": true
        }
      }
    }
  }
}
```

| Option | Default | Effect |
| --- | --- | --- |
| `strictConformance` | `false` | Report notation outside the SysML v2 specification as an error instead of a warning. |
| `keepLineBreaks` | `false` | Keep the author's line breaks when formatting, and fix only indentation and spacing. |
| `hoverMemberLimit` | `10` | Maximum number of members a hover lists. `0` omits the list. |
| `hoverInheritedMembers` | `false` | Include inherited members in hovers. |
| `disabledLints` | `[]` | Codes of lints to switch off. |
| `enabledLints` | `[]` | Codes of opt-in lints to switch on. |
| `libraryRoots` | `[]` | Additional directories searched for installed model libraries. |

The [OpenSysML language server reference](https://runtime.opensysml.org/reference/lsp/) describes each option in full.

### Semantic highlighting

`sysml-lsp` provides semantic tokens, which distinguish names by what they resolve to. Zed requests them only when asked. To layer them over the Tree-sitter highlighting:

```json
{
  "languages": {
    "SysML": { "semantic_tokens": "combined" },
    "KerML": { "semantic_tokens": "combined" }
  }
}
```

## Limitations

- Go to Definition on an element of the standard library opens an empty buffer. The server reports library declarations under its own `sysml-stdlib:` URI scheme, which Zed cannot read. Hovering such an element shows its signature and documentation.
- The diagram panel, the Run and Evaluate code lenses and the debugger described in the OpenSysML documentation belong to its VS Code extension.

## Development

`extension.toml` pins both grammars to one commit of tree-sitter-sysml. That repository's own queries follow nvim-treesitter conventions, which Zed's query dialect does not share, so the queries in `languages/sysml/` and `languages/kerml/` are maintained here:

- `highlights.scm`, `indents.scm`, `injections.scm` and `textobjects.scm` are adapted from the upstream files of the same name, and `outline.scm` from upstream `tags.scm`.
- `brackets.scm` and `overrides.scm` exist only here.

After changing the pinned commit, compare the adapted files with upstream `queries/<language>/`, and add any new declaration node to `outline.scm`, which lists each kind explicitly.

To try a change, run `zed: rebuild dev extension`, then `editor: restart language server` in an open SysML or KerML file, because the server stops when the extension reloads. Query errors appear in `zed: open log`.

## License

Apache-2.0. The query files adapted from tree-sitter-sysml are used under the same license.
