module.exports =
  indentClasses:
    description: 'Indent \'class\' and \'struct\' blocks so that the entire block is indented. The struct blocks are indented only if an access modifier, \'public:\', \'protected:\' or \'private:\', is declared somewhere in the struct. This option is effective for C++ files only.'
    type: 'boolean'
    default: false
    order: 1
  indentModifiers:
    title: 'Indent modifiers'
    description: 'Indent \'class\' and \'struct\' access modifiers, \'public:\', \'protected:\' and \'private:\', one half indent. The rest of the class is not indented. This option is effective for C++ files only. If used with indent‑classes this option will be ignored.'
    type: 'boolean'
    default: false
    order: 2
  indentSwitches:
    title: 'Indent switches'
    description: 'Indent \'switch\' blocks so that the \'case X:\' statements are indented in the switch block. The entire case block is indented.'
    type: 'boolean'
    default: false
    order: 3
  indentCases:
    title: 'Indent cases'
    description: 'Indent \'case X:\' blocks from the \'case X:\' headers. Case statements not enclosed in blocks are NOT indented.'
    type: 'boolean'
    default: false
    order: 4
  indentNamespace:
    title: 'Indent namespace'
    description: 'Add extra indentation to namespace blocks. This option has no effect on Java files.'
    type: 'boolean'
    default: false
    order: 5
  indentLabels:
    title: 'Indent labels'
    description: 'Add extra indentation to labels so they appear 1 indent less than the current indentation, rather than being flushed to the left (the default).'
    type: 'boolean'
    default: false
    order: 6
  indentPreprocBlock:
    title: 'Indent preprocessor blocks'
    description: 'Indent preprocessor blocks at bracket level zero, and immediately within a namespace. There are restrictions on what will be indented. Blocks within methods, classes, arrays, etc, will not be indented. Blocks containing brackets or multi-line define statements will not be indented. Without this option the preprocessor block is not indented.'
    type: 'boolean'
    default: false
    order: 7
  indentPreprocDefine:
    title: 'Indent preprocessor definitions'
    description: 'Indent multi-line preprocessor definitions ending with a backslash. Should be used with --convert-tabs for proper results. Does a pretty good job, but cannot perform miracles in obfuscated preprocessor definitions. Without this option the preprocessor statements remain unchanged.'
    type: 'boolean'
    default: false
    order: 8
  indentPreprocConditional:
    title: 'Indent preprocessor conditional statements'
    description: 'Indent preprocessor conditional statements to the same level as the source code.'
    type: 'boolean'
    default: false
    order: 9
  indentColumnComments:
    title: 'Indent C++ comments beginning in column one'
    description: 'By default C++ comments beginning in column one are assumed to be commented‑out code and not indented. This option will allow the comments to be indented with the code.'
    type: 'boolean'
    default: false
    order: 10
  minConditionalIndent:
    title: 'Minimun  conditional indent'
    description: 'Set the minimal indent that is added when a header is built of multiple lines. This indent helps to easily separate the header from the command statements that follow. '
    type: 'integer'
    default: 0
    order: 11
  maxInstatementIndent:
    title: 'Maximun instatement indent'
    description: 'Set the  maximum of # spaces to indent a continuation line. The # indicates a number of columns and must not be greater than 120. If no # is set, the default value of 40 will be used. A maximum of less than two indent lengths will be ignored. This option will prevent continuation lines from extending too far to the right. Setting a larger value will allow the code to be extended further to the right.'
    type: 'integer'
    default: 40
    order: 12

  addIndentOptions: (args) ->
    indentClasses = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentClasses'))
    if indentClasses
      args.push('--indent-classes')
    indentModifiers = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentModifiers'))
    if indentModifiers
      args.push('--indent-modifiers')
    indentSwitches = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentSwitches'))
    if indentSwitches
      args.push('--indent-switches')
    indentCases = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentCases'))
    if indentCases
      args.push('--indent-cases')
    indentNamespace = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentNamespace'))
    if indentNamespace
      args.push('--indent-namespaces')
    indentLabels = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentLabels'))
    if indentLabels
      args.push('--indent-labels')
    indentPreProc = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentPreProc'))
    if indentPreProc
      args.push('--indent-preproc-block')
    indentPreprocDefine = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentPreprocDefine'))
    if indentPreprocDefine
      args.push('--indent-preproc-define')
    indentPreprocConditional = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentPreprocConditional'))
    if indentPreprocConditional
      args.push('--indent-preproc-cond')
    indentColumnComments = Boolean(atom.config.get('formatter-astyle.IndentationOptions.indentColumnComments'))
    if indentColumnComments
      args.push('--indent-col1-comments')
    minConditionalIndent = Number(atom.config.get('formatter-astyle.IndentationOptions.minConditionalIndent'))
    if minConditionalIndent != 0
      args.push('--min-conditional-indent='+minConditionalIndent)
    maxInstatementIndent = Number(atom.config.get('formatter-astyle.IndentationOptions.maxInstatementIndent'))
    if maxInstatementIndent != 40
      args.push('--max-instatement-indent='+maxInstatementIndent)
