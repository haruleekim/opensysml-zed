; Adapted for Zed from queries/kerml/tags.scm in Open-MBEE/tree-sitter-sysml (Apache-2.0).

; A short name stands on its own or precedes the long name. Prefer the long name.

; Namespaces and memberships

[
  (package "package" @context name: (_) @name)
  (package !name "package" @context short_name: (_) @name)

  (library_package
    "library" @context
    "package" @context
    name: (_) @name)
  (library_package
    !name
    "library" @context
    "package" @context
    short_name: (_) @name)

  (namespace "namespace" @context name: (_) @name)
  (namespace !name "namespace" @context short_name: (_) @name)

  (alias_member "alias" @context name: (_) @name)
  (alias_member !name "alias" @context short_name: (_) @name)

  (dependency "dependency" @context name: (_) @name)
  (dependency !name "dependency" @context short_name: (_) @name)
] @item

; Types

[
  (type "type" @context name: (_) @name)
  (type !name "type" @context short_name: (_) @name)

  (classifier "classifier" @context name: (_) @name)
  (classifier !name "classifier" @context short_name: (_) @name)

  (data_type "datatype" @context name: (_) @name)
  (data_type !name "datatype" @context short_name: (_) @name)

  (class "class" @context name: (_) @name)
  (class !name "class" @context short_name: (_) @name)

  (structure "struct" @context name: (_) @name)
  (structure !name "struct" @context short_name: (_) @name)

  (association "assoc" @context name: (_) @name)
  (association !name "assoc" @context short_name: (_) @name)

  (association_structure
    "assoc" @context
    "struct" @context
    name: (_) @name)
  (association_structure
    !name
    "assoc" @context
    "struct" @context
    short_name: (_) @name)

  (metaclass "metaclass" @context name: (_) @name)
  (metaclass !name "metaclass" @context short_name: (_) @name)

  (interaction "interaction" @context name: (_) @name)
  (interaction !name "interaction" @context short_name: (_) @name)

  (behavior "behavior" @context name: (_) @name)
  (behavior !name "behavior" @context short_name: (_) @name)

  (function "function" @context name: (_) @name)
  (function !name "function" @context short_name: (_) @name)

  (predicate "predicate" @context name: (_) @name)
  (predicate !name "predicate" @context short_name: (_) @name)

  (multiplicity "multiplicity" @context name: (_) @name)
  (multiplicity !name "multiplicity" @context short_name: (_) @name)
] @item

; Features

[
  (feature "feature"? @context name: (_) @name)
  (feature !name "feature"? @context short_name: (_) @name)

  (step "step" @context name: (_) @name)
  (step !name "step" @context short_name: (_) @name)

  (expression_feature "expr" @context name: (_) @name)
  (expression_feature !name "expr" @context short_name: (_) @name)

  (boolean_expression "bool" @context name: (_) @name)
  (boolean_expression !name "bool" @context short_name: (_) @name)

  (invariant "inv" @context name: (_) @name)
  (invariant !name "inv" @context short_name: (_) @name)

  (connector "connector" @context name: (_) @name)
  (connector !name "connector" @context short_name: (_) @name)

  (binding_connector "binding" @context name: (_) @name)
  (binding_connector !name "binding" @context short_name: (_) @name)

  (succession "succession" @context name: (_) @name)
  (succession !name "succession" @context short_name: (_) @name)

  (flow "flow" @context name: (_) @name)
  (flow !name "flow" @context short_name: (_) @name)

  (succession_flow
    "succession" @context
    "flow" @context
    name: (_) @name)
  (succession_flow
    !name
    "succession" @context
    "flow" @context
    short_name: (_) @name)

  (metadata_feature "metadata"? @context name: (_) @name)
  (metadata_feature !name "metadata"? @context short_name: (_) @name)

  (cross_feature name: (_) @name)
  (cross_feature !name short_name: (_) @name)

  (connector_end name: (_) @name)

  (payload name: (_) @name)
  (payload !name short_name: (_) @name)
] @item

; Relationships

[
  (specialization "specialization" @context name: (_) @name)
  (specialization !name "specialization" @context short_name: (_) @name)

  (subclassification "specialization" @context name: (_) @name)
  (subclassification !name "specialization" @context short_name: (_) @name)

  (feature_typing "specialization" @context name: (_) @name)
  (feature_typing !name "specialization" @context short_name: (_) @name)

  (subsetting "specialization" @context name: (_) @name)
  (subsetting !name "specialization" @context short_name: (_) @name)

  (redefinition "specialization" @context name: (_) @name)
  (redefinition !name "specialization" @context short_name: (_) @name)

  (conjugation "conjugation" @context name: (_) @name)
  (conjugation !name "conjugation" @context short_name: (_) @name)

  (disjoining "disjoining" @context name: (_) @name)
  (disjoining !name "disjoining" @context short_name: (_) @name)

  (feature_inverting "inverting" @context name: (_) @name)
  (feature_inverting !name "inverting" @context short_name: (_) @name)

  (type_featuring "featuring" @context name: (_) @name)
  (type_featuring !name "featuring" @context short_name: (_) @name)
] @item

; Annotations

[
  (comment "comment" @context name: (_) @name)
  (comment !name "comment" @context short_name: (_) @name)

  (documentation "doc" @context name: (_) @name)
  (documentation !name "doc" @context short_name: (_) @name)

  (textual_representation "rep" @context name: (_) @name)
  (textual_representation !name "rep" @context short_name: (_) @name)
] @item

(line_note) @annotation

(block_note) @annotation
