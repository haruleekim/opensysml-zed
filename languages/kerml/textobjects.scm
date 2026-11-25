; Adapted for Zed from queries/kerml/textobjects.scm in Open-MBEE/tree-sitter-sysml (Apache-2.0).

; Alongside named declarations, a body can contain anonymous member keywords.

; Classes: types and namespaces

[
  (package body: (body "{" _* @class.inside "}")?)
  (library_package body: (body "{" _* @class.inside "}")?)
  (namespace body: (body "{" _* @class.inside "}")?)
  (type body: (body "{" _* @class.inside "}")?)
  (classifier body: (body "{" _* @class.inside "}")?)
  (data_type body: (body "{" _* @class.inside "}")?)
  (class body: (body "{" _* @class.inside "}")?)
  (structure body: (body "{" _* @class.inside "}")?)
  (association body: (body "{" _* @class.inside "}")?)
  (association_structure body: (body "{" _* @class.inside "}")?)
  (metaclass body: (body "{" _* @class.inside "}")?)
  (interaction body: (body "{" _* @class.inside "}")?)
  (multiplicity body: (body "{" _* @class.inside "}")?)
] @class.around

; Functions: behaviors, functions, predicates and their features

[
  (behavior body: (body "{" _* @function.inside "}")?)
  (function body: (body "{" _* @function.inside "}")?)
  (predicate body: (body "{" _* @function.inside "}")?)
  (step body: (body "{" _* @function.inside "}")?)
  (expression_feature body: (body "{" _* @function.inside "}")?)
  (boolean_expression body: (body "{" _* @function.inside "}")?)
  (invariant body: (body "{" _* @function.inside "}")?)
] @function.around

; Comments

(line_note)+ @comment.around

[
  (block_note)
  (regular_comment)
  (documentation)
  (comment)
] @comment.around
