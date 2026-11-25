; Adapted for Zed from queries/sysml/injections.scm in Open-MBEE/tree-sitter-sysml (Apache-2.0).

([
  (line_note)
  (block_note)
  (regular_comment)
] @injection.content
  (#set! injection.language "comment"))
