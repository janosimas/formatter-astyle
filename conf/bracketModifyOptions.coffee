module.exports =
  attachNamespaces:
    title: 'Attach namespaces'
    description: 'Attach brackets to a namespace statement. This is done regardless of the bracket style being used.'
    type: 'boolean'
    default: false
    order: 1
  attachClasses:
    title: 'Attach classes'
    description: 'Attach brackets to a class statement. This is done regardless of the bracket style being used.'
    type: 'boolean'
    default: false
    order: 2
  attachInlines:
    title: 'Attach inlines'
    description: 'Attach brackets to class and struct inline function definitions. This is not done for run-in type brackets (Horstmann and Pico styles). This option is effective for C++ files only.'
    type: 'boolean'
    default: false
    order: 3
  attachExternC:
    title: 'Attach extern C'
    description: 'Attach brackets to a bracketed extern "C" statement. This is done regardless of the bracket style being used. This option is effective for C++ files only.'
    type: 'boolean'
    default: false
    order: 4

  addBracketModifyOptions: (args) ->
    attachNamespaces = Boolean(atom.config.get('formatter-astyle.BracketModifyOptions.attachNamespaces'))
    if attachNamespaces
      args.push('--attach-namespaces')
    attachClasses = Boolean(atom.config.get('formatter-astyle.BracketModifyOptions.attachClasses'))
    if attachClasses
      args.push('--attach-classes')
    attachInlines = Boolean(atom.config.get('formatter-astyle.BracketModifyOptions.attachInlines'))
    if attachInlines
      args.push('--attach-inlines')
    attachExternC = Boolean(atom.config.get('formatter-astyle.BracketModifyOptions.attachExternC'))
    if attachExternC
      args.push('--attach-extern-c')
