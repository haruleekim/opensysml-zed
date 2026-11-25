; Adapted for Zed from queries/sysml/tags.scm in Open-MBEE/tree-sitter-sysml (Apache-2.0).

(line_note) @annotation

(block_note) @annotation

; A short name labels the item only when the full name is absent.

; Namespaces and annotating elements

[
  (package "package" @context name: (_) @name)
  (package !name "package" @context short_name: (_) @name)

  (library_package "library" @context "package" @context name: (_) @name)
  (library_package !name "library" @context "package" @context short_name: (_) @name)

  (namespace "namespace" @context name: (_) @name)
  (namespace !name "namespace" @context short_name: (_) @name)

  (alias_member "alias" @context name: (_) @name)
  (alias_member !name "alias" @context short_name: (_) @name)

  (dependency "dependency" @context name: (_) @name)
  (dependency !name "dependency" @context short_name: (_) @name)

  (comment "comment" @context name: (_) @name)
  (comment !name "comment" @context short_name: (_) @name)

  (documentation "doc" @context name: (_) @name)
  (documentation !name "doc" @context short_name: (_) @name)

  (textual_representation "rep" @context name: (_) @name)
  (textual_representation !name "rep" @context short_name: (_) @name)
] @item

; Definitions

[
  (attribute_definition "attribute" @context "def" @context name: (_) @name)
  (attribute_definition !name "attribute" @context "def" @context short_name: (_) @name)

  (enumeration_definition "enum" @context "def" @context name: (_) @name)
  (enumeration_definition !name "enum" @context "def" @context short_name: (_) @name)

  (occurrence_definition "occurrence" @context "def" @context name: (_) @name)
  (occurrence_definition !name "occurrence" @context "def" @context short_name: (_) @name)

  (item_definition "item" @context "def" @context name: (_) @name)
  (item_definition !name "item" @context "def" @context short_name: (_) @name)

  (metadata_definition "metadata" @context "def" @context name: (_) @name)
  (metadata_definition !name "metadata" @context "def" @context short_name: (_) @name)

  (part_definition "part" @context "def" @context name: (_) @name)
  (part_definition !name "part" @context "def" @context short_name: (_) @name)

  (connection_definition "connection" @context "def" @context name: (_) @name)
  (connection_definition !name "connection" @context "def" @context short_name: (_) @name)

  (flow_definition "flow" @context "def" @context name: (_) @name)
  (flow_definition !name "flow" @context "def" @context short_name: (_) @name)

  (interface_definition "interface" @context "def" @context name: (_) @name)
  (interface_definition !name "interface" @context "def" @context short_name: (_) @name)

  (allocation_definition "allocation" @context "def" @context name: (_) @name)
  (allocation_definition !name "allocation" @context "def" @context short_name: (_) @name)

  (port_definition "port" @context "def" @context name: (_) @name)
  (port_definition !name "port" @context "def" @context short_name: (_) @name)

  (action_definition "action" @context "def" @context name: (_) @name)
  (action_definition !name "action" @context "def" @context short_name: (_) @name)

  (calculation_definition "calc" @context "def" @context name: (_) @name)
  (calculation_definition !name "calc" @context "def" @context short_name: (_) @name)

  (state_definition "state" @context "def" @context name: (_) @name)
  (state_definition !name "state" @context "def" @context short_name: (_) @name)

  (constraint_definition "constraint" @context "def" @context name: (_) @name)
  (constraint_definition !name "constraint" @context "def" @context short_name: (_) @name)

  (requirement_definition "requirement" @context "def" @context name: (_) @name)
  (requirement_definition !name
    "requirement" @context "def" @context short_name: (_) @name)

  (concern_definition "concern" @context "def" @context name: (_) @name)
  (concern_definition !name "concern" @context "def" @context short_name: (_) @name)

  (case_definition "case" @context "def" @context name: (_) @name)
  (case_definition !name "case" @context "def" @context short_name: (_) @name)

  (analysis_case_definition "analysis" @context "def" @context name: (_) @name)
  (analysis_case_definition !name
    "analysis" @context "def" @context short_name: (_) @name)

  (verification_case_definition "verification" @context "def" @context name: (_) @name)
  (verification_case_definition !name
    "verification" @context "def" @context short_name: (_) @name)

  (use_case_definition "use" @context "case" @context "def" @context name: (_) @name)
  (use_case_definition !name
    "use" @context "case" @context "def" @context short_name: (_) @name)

  (view_definition "view" @context "def" @context name: (_) @name)
  (view_definition !name "view" @context "def" @context short_name: (_) @name)

  (viewpoint_definition "viewpoint" @context "def" @context name: (_) @name)
  (viewpoint_definition !name "viewpoint" @context "def" @context short_name: (_) @name)

  (rendering_definition "rendering" @context "def" @context name: (_) @name)
  (rendering_definition !name "rendering" @context "def" @context short_name: (_) @name)

  (extended_definition "def" @context name: (_) @name)
  (extended_definition !name "def" @context short_name: (_) @name)
] @item

; Usages and connections

[
  (attribute_usage "attribute" @context name: (_) @name)
  (attribute_usage !name "attribute" @context short_name: (_) @name)

  (expression_usage "expr" @context name: (_) @name)
  (expression_usage !name "expr" @context short_name: (_) @name)

  (enumeration_usage "enum" @context name: (_) @name)
  (enumeration_usage !name "enum" @context short_name: (_) @name)

  (occurrence_usage "occurrence" @context name: (_) @name)
  (occurrence_usage !name "occurrence" @context short_name: (_) @name)

  (item_usage "item" @context name: (_) @name)
  (item_usage !name "item" @context short_name: (_) @name)

  (part_usage "part" @context name: (_) @name)
  (part_usage !name "part" @context short_name: (_) @name)

  (port_usage "port" @context name: (_) @name)
  (port_usage !name "port" @context short_name: (_) @name)

  (view_usage "view" @context name: (_) @name)
  (view_usage !name "view" @context short_name: (_) @name)

  (rendering_usage "rendering" @context name: (_) @name)
  (rendering_usage !name "rendering" @context short_name: (_) @name)

  (viewpoint_usage "viewpoint" @context name: (_) @name)
  (viewpoint_usage !name "viewpoint" @context short_name: (_) @name)

  (action_usage "action" @context name: (_) @name)
  (action_usage !name "action" @context short_name: (_) @name)

  (calculation_usage "calc" @context name: (_) @name)
  (calculation_usage !name "calc" @context short_name: (_) @name)

  (state_usage "state" @context name: (_) @name)
  (state_usage !name "state" @context short_name: (_) @name)

  (constraint_usage "constraint" @context name: (_) @name)
  (constraint_usage !name "constraint" @context short_name: (_) @name)

  (requirement_usage "requirement" @context name: (_) @name)
  (requirement_usage !name "requirement" @context short_name: (_) @name)

  (concern_usage "concern" @context name: (_) @name)
  (concern_usage !name "concern" @context short_name: (_) @name)

  (case_usage "case" @context name: (_) @name)
  (case_usage !name "case" @context short_name: (_) @name)

  (analysis_case_usage "analysis" @context name: (_) @name)
  (analysis_case_usage !name "analysis" @context short_name: (_) @name)

  (verification_case_usage "verification" @context name: (_) @name)
  (verification_case_usage !name "verification" @context short_name: (_) @name)

  (use_case_usage "use" @context "case" @context name: (_) @name)
  (use_case_usage !name "use" @context "case" @context short_name: (_) @name)

  (metadata_usage "metadata"? @context name: (_) @name)
  (metadata_usage !name "metadata"? @context short_name: (_) @name)

  (event_occurrence_usage "event" @context "occurrence" @context name: (_) @name)
  (event_occurrence_usage !name
    "event" @context "occurrence" @context short_name: (_) @name)

  (connection_usage "connection" @context name: (_) @name)
  (connection_usage !name "connection" @context short_name: (_) @name)

  (interface_usage "interface" @context name: (_) @name)
  (interface_usage !name "interface" @context short_name: (_) @name)

  (allocation_usage "allocation" @context name: (_) @name)
  (allocation_usage !name "allocation" @context short_name: (_) @name)

  (binding_connector_as_usage "binding" @context name: (_) @name)
  (binding_connector_as_usage !name "binding" @context short_name: (_) @name)

  (succession_as_usage "succession" @context name: (_) @name)
  (succession_as_usage !name "succession" @context short_name: (_) @name)

  (message "message" @context name: (_) @name)
  (message !name "message" @context short_name: (_) @name)

  (flow_usage "flow" @context name: (_) @name)
  (flow_usage !name "flow" @context short_name: (_) @name)

  (succession_flow_usage "succession" @context "flow" @context name: (_) @name)
  (succession_flow_usage !name
    "succession" @context "flow" @context short_name: (_) @name)

  (perform_action_usage "perform" @context "action" @context name: (_) @name)
  (perform_action_usage !name "perform" @context "action" @context short_name: (_) @name)

  (exhibit_state_usage "exhibit" @context "state" @context name: (_) @name)
  (exhibit_state_usage !name "exhibit" @context "state" @context short_name: (_) @name)

  (include_use_case_usage
    "include" @context "use" @context "case" @context name: (_) @name)
  (include_use_case_usage !name
    "include" @context "use" @context "case" @context short_name: (_) @name)

  (assert_constraint_usage "assert" @context "constraint" @context name: (_) @name)
  (assert_constraint_usage !name
    "assert" @context "constraint" @context short_name: (_) @name)

  (satisfy_requirement_usage "satisfy" @context "requirement" @context name: (_) @name)
  (satisfy_requirement_usage !name
    "satisfy" @context "requirement" @context short_name: (_) @name)
] @item

; Requirement, case and view members

[
  (subject_usage "subject" @context name: (_) @name)
  (subject_usage !name "subject" @context short_name: (_) @name)

  (actor_usage "actor" @context name: (_) @name)
  (actor_usage !name "actor" @context short_name: (_) @name)

  (stakeholder_usage "stakeholder" @context name: (_) @name)
  (stakeholder_usage !name "stakeholder" @context short_name: (_) @name)

  (requirement_constraint_usage
    kind: ["assume" "require"] @context "constraint"? @context name: (_) @name)
  (requirement_constraint_usage !name
    kind: ["assume" "require"] @context "constraint"? @context short_name: (_) @name)

  (framed_concern_usage "frame" @context "concern"? @context name: (_) @name)
  (framed_concern_usage !name "frame" @context "concern"? @context short_name: (_) @name)

  (requirement_verification_usage
    "verify" @context "requirement"? @context name: (_) @name)
  (requirement_verification_usage !name
    "verify" @context "requirement"? @context short_name: (_) @name)

  (objective_requirement_usage "objective" @context name: (_) @name)
  (objective_requirement_usage !name "objective" @context short_name: (_) @name)

  (view_rendering_usage "render" @context "rendering"? @context name: (_) @name)
  (view_rendering_usage !name
    "render" @context "rendering"? @context short_name: (_) @name)
] @item

; Action and state declarations

[
  (send_node "action" @context name: (_) @name)
  (send_node !name "action" @context short_name: (_) @name)

  (accept_node "action" @context name: (_) @name)
  (accept_node !name "action" @context short_name: (_) @name)

  (assignment_node "action" @context name: (_) @name)
  (assignment_node !name "action" @context short_name: (_) @name)

  (if_node "action" @context name: (_) @name)
  (if_node !name "action" @context short_name: (_) @name)

  (while_loop_node "action" @context name: (_) @name)
  (while_loop_node !name "action" @context short_name: (_) @name)

  (for_loop_node "action" @context name: (_) @name)
  (for_loop_node !name "action" @context short_name: (_) @name)

  (terminate_node "action" @context name: (_) @name)
  (terminate_node !name "action" @context short_name: (_) @name)

  (action_body_parameter "action" @context name: (_) @name)
  (action_body_parameter !name "action" @context short_name: (_) @name)

  (merge_node "merge" @context name: (_) @name)
  (merge_node !name "merge" @context short_name: (_) @name)

  (decision_node "decide" @context name: (_) @name)
  (decision_node !name "decide" @context short_name: (_) @name)

  (join_node "join" @context name: (_) @name)
  (join_node !name "join" @context short_name: (_) @name)

  (fork_node "fork" @context name: (_) @name)
  (fork_node !name "fork" @context short_name: (_) @name)

  (final_node "done" @context name: (_) @name)

  (transition_usage "transition" @context name: (_) @name)
  (transition_usage !name "transition" @context short_name: (_) @name)

  (effect "do" @context "perform"? @context "action" @context name: (_) @name)
  (effect !name "do" @context "perform"? @context "action" @context short_name: (_) @name)

  (state_subaction
    kind: ["entry" "do" "exit"] @context "perform"? @context "action" @context
    name: (_) @name)
  (state_subaction !name
    kind: ["entry" "do" "exit"] @context "perform"? @context "action" @context
    short_name: (_) @name)

  (pseudostate
    ["deep" "shallow"]? @context ["choice" "junction" "history"] @context
    name: (_) @name)
] @item

; Names declared without a kind keyword

[
  (reference_usage name: (_) @name)
  (reference_usage !name short_name: (_) @name)

  (connector_end name: (_) @name)

  (cross_feature name: (_) @name)
  (cross_feature !name short_name: (_) @name)

  (payload name: (_) @name)
  (payload !name short_name: (_) @name)

  (payload_parameter name: (_) @name)
  (payload_parameter !name short_name: (_) @name)

  (for_variable name: (_) @name)
  (for_variable !name short_name: (_) @name)
] @item
