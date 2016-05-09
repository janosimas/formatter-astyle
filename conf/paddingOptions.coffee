module.exports =
  breakBlocks:
    title: 'Break blocks'
    description: 'Pad empty lines around header blocks (e.g. \'if\', \'for\', \'while\'...).'
    type: 'boolean'
    default: false
    order: 1
  breakBlocksAll:
    title: 'Break blocks (all)'
    description: 'Pad empty lines around header blocks (e.g. \'if\', \'for\', \'while\'...). Treat closing header blocks (e.g. \'else\', \'catch\') as stand-alone blocks.'
    type: 'boolean'
    default: false
    order: 2
  padOper:
    title: 'Operators'
    description: 'Insert space padding around operators. Any end of line comments will remain in the original column, if possible. Note that there is no option to unpad. Once padded, they stay padded.'
    type: 'boolean'
    default: false
    order: 3
  padParen:
    title: 'Parenthesis'
    description: 'Insert space padding around parenthesis on both the outside and the inside. Any end of line comments will remain in the original column, if possible.'
    type: 'boolean'
    default: false
    order: 4
  padParenOut:
    title: 'Parenthesis outside'
    description: 'Insert space padding around parenthesis on the outside only. Parentheses that are empty will not be padded. Any end of line comments will remain in the original column, if possible. This can be used with unpad-paren below to remove unwanted spaces.'
    type: 'boolean'
    default: false
    order: 5
  padFirstParenOut:
    title: 'First parenthesis outside'
    description: 'Insert space padding around the first parenthesis in a series on the outside only. Parentheses that are empty will not be padded. Any end of line comments will remain in the original column, if possible. This can be used with unpad-paren below to remove unwanted spaces. If used with pad‑paren or pad‑paren‑out, this option will be ignored. If used with pad‑paren‑in, the result will be the same as pad‑paren.'
    type: 'boolean'
    default: false
    order: 6
  padParenIn:
    title: 'Parenthesis inside'
    description: 'Insert space padding around parenthesis on the inside only. Any end of line comments will remain in the original column, if possible. This can be used with unpad-paren below to remove unwanted spaces.'
    type: 'boolean'
    default: false
    order: 7
  padHeader:
    title: 'Header'
    description: 'Insert space padding between a header (e.g. \'if\', \'for\', \'while\'...) and the following paren. Any end of line comments will remain in the original column, if possible. This can be used with unpad-paren to remove unwanted spaces.'
    type: 'boolean'
    default: false
    order: 8
  unpadParen:
    title: 'Unpad parenthesis'
    description: 'Remove extra space padding around parenthesis on the inside and outside. Any end of line comments will remain in the original column, if possible. This option can be used in combination with the paren padding options pad‑paren, pad‑paren‑out, pad‑paren‑in, and pad‑header above. Only padding that has not been requested by other options will be removed.\nFor example, if a source has parens padded on both the inside and outside, and you want inside only. You need to use unpad-paren to remove the outside padding, and pad‑paren‑in to retain the inside padding. Using only pad‑paren‑in would not remove the outside padding.'
    type: 'boolean'
    default: false
    order: 9
  deleteEmptyLines:
    title: 'Delete empty lines'
    description: 'Delete empty lines within a function or method. Empty lines outside of functions or methods are NOT deleted. If used with break-blocks or break-blocks=all it will delete all lines EXCEPT the lines added by the break-blocks options.'
    type: 'boolean'
    default: false
    order: 10
  fillEmptyLines:
    title: 'Fill empty lines'
    description: 'Fill empty lines with the white space of the previous line.'
    type: 'boolean'
    default: false
    order: 11
  alignPointer:
    title: 'Align pointer'
    description: 'Attach a pointer or reference operator (*, &, or ^) to either the variable type (left) or variable name (right), or place it between the type and name (middle). The spacing between the type and name will be preserved, if possible. This option is for C/C++, C++/CLI, and C# files. To format references separately use the following align-reference option.'
    type: 'string'
    default: 'none'
    enum: ['none', 'type', 'middle', 'name']
    order: 12
  alignReference:
    title: 'Align reference'
    description: 'This option will align references separate from pointers. Pointers are not changed by this option. If pointers and references are to be aligned the same, use the previous align-pointer option. The option align-reference=none will not change the reference alignment. The other options are the same as for align-pointer. This option is for C/C++, C++/CLI, and C# files.'
    type: 'string'
    default: 'none'
    enum: ['none', 'type', 'middle', 'name']
    order: 13

  addPaddingOptions: (args) ->
    breakBlocks = Boolean(atom.config.get('formatter-astyle.PaddingOptions.breakBlocks'))
    if breakBlocks
      args.push('--break-blocks')
    breakBlocksAll = Boolean(atom.config.get('formatter-astyle.PaddingOptions.breakBlocksAll'))
    if breakBlocksAll
      args.push('--break-blocks=all')
    padOper = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padOper'))
    if padOper
      args.push('--pad-oper')
    padParen = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padParen'))
    if padParen
      args.push('--pad-paren')
    padParenOut = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padParenOut'))
    if padParenOut
      args.push('--pad-paren-out')
    padFirstParenOut = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padFirstParenOut'))
    if padFirstParenOut
      args.push('--pad-first-paren-out')
    padParenIn = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padParenIn'))
    if padParenIn
      args.push('--pad-paren-in')
    padHeader = Boolean(atom.config.get('formatter-astyle.PaddingOptions.padHeader'))
    if padHeader
      args.push('--pad-header')
    unpadParen = Boolean(atom.config.get('formatter-astyle.PaddingOptions.unpadParen'))
    if unpadParen
      args.push('--unpad-paren')
    deleteEmptyLines = Boolean(atom.config.get('formatter-astyle.PaddingOptions.deleteEmptyLines'))
    if deleteEmptyLines
      args.push('--delete-empty-lines')
    fillEmptyLines = Boolean(atom.config.get('formatter-astyle.PaddingOptions.fillEmptyLines'))
    if fillEmptyLines
      args.push('--fill-empty-lines')
    alignPointer = atom.config.get('formatter-astyle.PaddingOptions.alignPointer').toString()
    if alignPointer != 'none'
      args.push('--align-pointer='+alignPointer)
    alignReference = atom.config.get('formatter-astyle.PaddingOptions.alignReference').toString()
    if alignReference != 'none'
      args.push('--align-reference='+alignReference)
