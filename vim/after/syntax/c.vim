syntax match customFunction /\w\+\s*\((\)\@=/
hi link customFunction Function

syntax match customType /\([#=].*\)\@<!\(^\s*[a-zA-Z_][a-zA-Z0-9_]*\s*(\)\@<![a-zA-Z_][a-zA-Z0-9_]*\([ &\*]\+[a-zA-Z_][a-zA-Z0-9_]*\>\(.*,\s*$\)\@!\)\@=/
hi link customType Type

syntax match cStructureParent /\(\.\|->\)\@<![a-zA-Z_][a-zA-Z0-9_]*\(\.\|->\)\@=/
syntax match cStructureChild /\(\.\|->\)\@<=[a-zA-Z_][a-zA-Z0-9_]*/
