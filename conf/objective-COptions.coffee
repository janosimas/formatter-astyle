module.exports =
  alignMethodColon:
    title: 'Align method colon'
    description: 'Align the colons in Objective‑C method declarations. This option is effective for Objective‑C files only.'
    type: 'boolean'
    default: false
    order: 1
  padMethodPrefix:
    title: 'Pad method prefix'
    description: 'Insert space padding after the \'-\' or \'+\' Objective‑C method prefix. This will add exactly one space. Any additional spaces will be deleted. This option is effective for Objective‑C files only.'
    type: 'boolean'
    default: false
    order: 2
  unpadMethodPrefix:
    title: 'Unpad method prefix'
    description: 'Remove all space padding after the \'-\' or \'+\' Objective‑C method prefix. If used with pad‑method‑prefix, this option will be ignored. This option is effective for Objective‑C files only.'
    type: 'boolean'
    default: false
    order: 3
  padMethodColon:
    title: 'Padding method'
    description: 'Add or remove space padding before or after the colons in an Objective‑C method call. These options will pad exactly one space. Any additional spaces will be deleted. Colons immediately preceding a paren will not be padded. This option is effective for Objective‑C files only.'
    type: 'string'
    default: 'default'
    enum: ['default', 'none', 'all', 'after', 'before']
    order: 4

  addObjectiveCOptions: (args) ->
    alignMethodColon = Boolean(atom.config.get('formatter-astyle.ObjectiveCOptions.alignMethodColon'))
    if alignMethodColon
      args.push('--align-method-colon')
    padMethodPrefix = Boolean(atom.config.get('formatter-astyle.ObjectiveCOptions.padMethodPrefix'))
    if padMethodPrefix
      args.push('--pad-method-prefix')
    unpadMethodPrefix = Boolean(atom.config.get('formatter-astyle.ObjectiveCOptions.unpadMethodPrefix'))
    if unpadMethodPrefix
      args.push('--unpad-method-prefix')
    alignMethodColon = Boolean(atom.config.get('formatter-astyle.ObjectiveCOptions.alignMethodColon'))
    if alignMethodColon
      args.push('--align-method-colon')
    padMethodColon = atom.config.get('formatter-astyle.ObjectiveCOptions.padMethodColon').toString()
    if padMethodColon != 'default'
      args.push('--pad-method-colon='+padMethodColon)
