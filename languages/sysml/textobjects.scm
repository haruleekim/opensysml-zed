; Adapted for Zed from queries/sysml/textobjects.scm in Open-MBEE/tree-sitter-sysml (Apache-2.0).

; Classes: definitions and namespaces

[
  (package
    body: (body "{" (_)* @class.inside "}")?)
  (library_package
    body: (body "{" (_)* @class.inside "}")?)
  (namespace
    body: (body "{" (_)* @class.inside "}")?)
  (part_definition
    body: (body "{" (_)* @class.inside "}")?)
  (item_definition
    body: (body "{" (_)* @class.inside "}")?)
  (attribute_definition
    body: (body "{" (_)* @class.inside "}")?)
  (enumeration_definition
    body: (body "{" (_)* @class.inside "}")?)
  (occurrence_definition
    body: (body "{" (_)* @class.inside "}")?)
  (port_definition
    body: (body "{" (_)* @class.inside "}")?)
  (connection_definition
    body: (body "{" (_)* @class.inside "}")?)
  (interface_definition
    body: (body "{" (_)* @class.inside "}")?)
  (allocation_definition
    body: (body "{" (_)* @class.inside "}")?)
  (flow_definition
    body: (body "{" (_)* @class.inside "}")?)
  (metadata_definition
    body: (body "{" (_)* @class.inside "}")?)
  (extended_definition
    body: (body "{" (_)* @class.inside "}")?)
  (state_definition
    body: (body "{" (_)* @class.inside "}")?)
  (constraint_definition
    body: (body "{" (_)* @class.inside "}")?)
  (requirement_definition
    body: (body "{" (_)* @class.inside "}")?)
  (concern_definition
    body: (body "{" (_)* @class.inside "}")?)
  (case_definition
    body: (body "{" (_)* @class.inside "}")?)
  (analysis_case_definition
    body: (body "{" (_)* @class.inside "}")?)
  (verification_case_definition
    body: (body "{" (_)* @class.inside "}")?)
  (use_case_definition
    body: (body "{" (_)* @class.inside "}")?)
  (view_definition
    body: (body "{" (_)* @class.inside "}")?)
  (viewpoint_definition
    body: (body "{" (_)* @class.inside "}")?)
  (rendering_definition
    body: (body "{" (_)* @class.inside "}")?)
] @class.around

; Functions: actions, calculations, constraints

[
  (action_definition
    body: (body "{" (_)* @function.inside "}")?)
  (calculation_definition
    body: (body "{" (_)* @function.inside "}")?)
  (action_usage
    body: (body "{" (_)* @function.inside "}")?)
  (calculation_usage
    body: (body "{" (_)* @function.inside "}")?)
  (constraint_usage
    body: (body "{" (_)* @function.inside "}")?)
  (assert_constraint_usage
    body: (body "{" (_)* @function.inside "}")?)
  (requirement_constraint_usage
    body: (body "{" (_)* @function.inside "}")?)
  (perform_action_usage
    body: (body "{" (_)* @function.inside "}")?)
  (state_usage
    body: (body "{" (_)* @function.inside "}")?)
  (transition_usage
    body: (body "{" (_)* @function.inside "}")?)
] @function.around

; Comments

[
  (line_note)
  (block_note)
  (regular_comment)
  (documentation)
  (comment)
] @comment.around
