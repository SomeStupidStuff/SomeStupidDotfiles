syntax keyword pythonSelf self
syntax keyword pythonNone None
syntax keyword pythonBoolean True False
syntax keyword pythonMagicMethods __abs__ __add__ __and__ __bool__ __ceil__ __class__ __delattr__ __dir__ __divmod__ __doc__ __eq__ __float__ __floor__ __floordiv__ __format__ __ge__ __getattribute__ __getnewargs__ __gt__ __hash__ __index__ __init__ __init_subclass__ __int__ __invert__ __le__ __lshift__ __lt__ __mod__ __mul__ __ne__ __neg__ __new__ __or__ __pos__ __pow__ __radd__ __rand__ __rdivmod__ __reduce__ __reduce_ex__ __repr__ __rfloordiv__ __rlshift__ __rmod__ __rmul__ __ror__ __round__ __rpow__ __rrshift__ __rshift__ __rsub__ __rtruediv__ __rxor__ __setattr__ __sizeof__ __str__ __sub__ __subclasshook__ __truediv__ __trunc__ __xor__
syntax keyword pythonBuiltinType int str list dict set float complex tuple frozenset bytes bytearray
syntax keyword pythonBuiltinFunction abs delattr hash memoryview all help min setattr any dir hex next slice ascii divmod id object sorted bin enumerate input oct staticmethod bool eval open breakpoint exec isinstance ord sum filter issubclass pow super iter print callable format len property type chr range vars classmethod getattr locals repr zip compile globals map reversed __import__ hasattr max round containedin=pythonBuiltin

syntax match pythonClass /\v(class.*)@<=\w+/ containedin=pythonFunction
syntax match pythonFuncVar /\v(def\s+\w+\s*\([^)]*)@<=([[:]\s*)@<!<\w+>(\s*[[\]])@!/

syntax match pythonDefineFunction /\v(def\s+)@<=\w+/ containedin=pythonFunction contains=pythonMagicMethods
syntax match pythonFunctionCall /\v\w+(\s*\()@=/ contains=pythonDefineFunction
hi def link pythonDefineFunction Function
hi def link pythonFunctionCall Function

syntax match pythonConstant /\v<[A-Z][A-Z0-9_]+>/

syntax match pythonSymbolOperator /\v[+\-*/%=<>&|^!]/

syntax match pythonRegexEscapeSymbol /\v\\[^a-zA-Z]/ containedin=pythonRawString,pythonRegexSet contained
syntax match pythonRegexEscapeLetter /\v\\[a-zA-Z]/ containedin=pythonRawString,pythonRegexSet contained
syntax match pythonRegexSymbols /\v\\@<![+*?|]/ containedin=pythonRawString contained
syntax match pythonRegexParens /\v\\@<![()]/ containedin=pythonRawString contained
syntax match pythonRegexNumberQuantifier /\v\{\d+,(\d+)?\}|\{,\d+\}/ containedin=pythonRawString contained
syntax match pythonRegexLookAround /\v\(@<=\?(\<)?[!=]/ containedin=pythonRawString contained
syntax region pythonRegexSet start="\[" end="\]" skip="\\\]" containedin=pythonRawString contained
