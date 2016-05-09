module.exports =
  breakClosingBrackets:
    title: 'Break closing brackets'
    description: 'When used with --style=java, --style=kr, --style=stroustrup, --style=linux, or --style=1tbs, this breaks closing headers (e.g. \'else\', \'catch\', ...) from their immediately preceding closing brackets. Closing header brackets are always broken with the other styles.'
    type: 'boolean'
    default: false
    order: 1
  breakElseifs:
    title: 'Break elseif'
    description: 'Break "else if" header combinations into separate lines. This option has no effect if keep-one-line-statements is used, the "else if" statements will remain as they are.\nIf this option is NOT used, "else if" header combinations will be placed on a single line.'
    type: 'boolean'
    default: false
    order: 2
  addBrackets:
    title: 'Add brackets'
    description: 'Add brackets to unbracketed one line conditional statements (e.g. \'if\', \'for\', \'while\'...). The statement must be on a single line. The brackets will be added according to the currently requested predefined style or bracket type. If no style or bracket type is requested the brackets will be attached. If --add-one-line-brackets is also used the result will be one line brackets.'
    type: 'boolean'
    default: false
    order: 3
  addOneLineBrackets:
    title: 'Add one line brackets'
    description: 'Add one line brackets to unbracketed one line conditional statements (e.g. \'if\', \'for\', \'while\'...). The statement must be on a single line. The option implies --keep-one-line-blocks and will not break the one line blocks.'
    type: 'boolean'
    default: false
    order: 4
  removeBrackets:
    title: 'Remove brackets'
    description: 'Remove brackets from conditional statements (e.g. \'if\', \'for\', \'while\'...). The statement must be a single statement on a single line. If --add-brackets or --add-one-line-brackets is also used the result will be to add brackets. Brackets will not be removed from "One True Brace Style", --style=1tbs.'
    type: 'boolean'
    default: false
    order: 5
  keepOneLineBlocks:
    title: 'Keep one line blocks'
    description: 'Don\'t break one-line blocks.'
    type: 'boolean'
    default: false
    order: 6
  keepOneLineStatements:
    title: 'Keep one line statements'
    description: 'Don\'t break complex statements and multiple statements residing on a single line.'
    type: 'boolean'
    default: false
    order: 7
  convertTabs:
    title: 'Convert tabs'
    description: 'Converts tabs into spaces in the non-indentation part of the line. The number of spaces inserted will maintain the spacing of the tab. The current setting for spaces per tab is used. It may not produce the expected results if convert-tabs is used when changing spaces per tab. Tabs are not replaced in quotes.'
    type: 'boolean'
    default: false
    order: 8
  closeTemplates:
    title: 'Close templates'
    description: 'Closes whitespace in the angle brackets of template definitions. Closing the ending angle brackets is now allowed by the C++11 standard. Be sure your compiler supports this before making the changes.'
    type: 'boolean'
    default: false
    order: 9
  removeCommentPrefix:
    title: 'Remove comment prefix'
    description: 'Remove the preceding \'*\' in a multi-line comment that begins a line. A trailing \'*\', if present, is also removed. Text that is less than one indent is indented to one indent. Text greater than one indent is not changed. Multi-line comments that begin a line but without the preceding \'*\' are indented to one indent for consistency. This can slightly modify the indentation of commented out blocks of code. Lines containing all \'*\' are left unchanged. Extra spacing is removed from the comment close \'*\/\'.'
    type: 'boolean'
    default: false
    order: 10
  maxCodeLength:
    title: 'Max code length'
    description: 'The option max‑code‑length will break a line if the code exceeds # characters. The valid values are 50 thru 200. Lines without logical conditionals will break on a logical conditional (||, &&, ...), comma, paren, semicolon, or space.'
    type: 'integer'
    default: 0
    order: 11
  breakAfterLogical:
    title: 'Break after logical'
    description: 'By default logical conditionals will be placed first on the new line. The option break‑after‑logical will cause the logical conditionals to be placed last on the previous line. This option has no effect without max‑code‑length.'
    type: 'boolean'
    default: false
    order: 12
  mode:
    title: 'Mode'
    description: 'Indent a C type, C#, or Java file. C type files are C, C++, C++/CLI, and Objective-C.  The option is usually set from the file extension for each file. You can override the setting with this entry. It will be used for all files regardless of the file extension. It allows the formatter to identify language specific syntax such as C++ classes, templates, and keywords.'
    type: 'string'
    default: 'default'
    order: 13
    enum: ['default', 'c', 'cs', 'java']

  addFormattingOptions: (args) ->
    breakClosingBrackets = Boolean(atom.config.get('formatter-astyle.FormattingOptions.breakClosingBrackets'))
    if breakClosingBrackets
      args.push('--break-closing-brackets')
    breakElseifs = Boolean(atom.config.get('formatter-astyle.FormattingOptions.breakElseifs'))
    if breakElseifs
      args.push('--break-elseifs')
    addBrackets = Boolean(atom.config.get('formatter-astyle.FormattingOptions.addBrackets'))
    if addBrackets
      args.push('--add-brackets')
    addOneLineBrackets = Boolean(atom.config.get('formatter-astyle.FormattingOptions.addOneLineBrackets'))
    if addOneLineBrackets
      args.push('--add-one-line-brackets')
    removeBrackets = Boolean(atom.config.get('formatter-astyle.FormattingOptions.removeBrackets'))
    if removeBrackets
      args.push('--remove-brackets')
    keepOneLineBlocks = Boolean(atom.config.get('formatter-astyle.FormattingOptions.keepOneLineBlocks'))
    if keepOneLineBlocks
      args.push('--keep-one-line-blocks')
    keepOneLineStatements = Boolean(atom.config.get('formatter-astyle.FormattingOptions.keepOneLineStatements'))
    if keepOneLineStatements
      args.push('--keep-one-line-statements')
    convertTabs = Boolean(atom.config.get('formatter-astyle.FormattingOptions.convertTabs'))
    if convertTabs
      args.push('--convert-tabs')
    closeTemplates = Boolean(atom.config.get('formatter-astyle.FormattingOptions.closeTemplates'))
    if closeTemplates
      args.push('--close-templates')
    removeCommentPrefix = Boolean(atom.config.get('formatter-astyle.FormattingOptions.removeCommentPrefix'))
    if removeCommentPrefix
      args.push('--remove-comment-prefix')
    maxCodeLength = Number(atom.config.get('formatter-astyle.FormattingOptions.maxCodeLength'))
    if maxCodeLength != 0
      args.push('--max-code-length='+maxCodeLength)
    breakAfterLogical = Boolean(atom.config.get('formatter-astyle.FormattingOptions.breakAfterLogical'))
    if breakAfterLogical
      args.push('--break-after-logical')
    mode = atom.config.get('formatter-astyle.FormattingOptions.mode').toString()
    if mode != 'default'
      args.push('--mode='+mode)
