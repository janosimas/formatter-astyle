module.exports =
  bracketStyle:
    title: 'Bracket Style'
    type: 'string'
    default: 'default'
    enum: [ 'default' , 'allman', 'java', 'kr', 'stroustrup', 'whitesmith', 'vtk', 'banner', 'gnu', 'linux', 'horstmann', '1tbs', 'google', 'pico', 'lisp']
    order: 1
  tabStyle:
    title: 'Tab Options'
    type: 'string'
    default: 'default'
    enum: [ 'default' , 'spaces', 'tab']
    order: 2
  indentSize:
    title: 'Indent'
    type: 'integer'
    default: 4
    order: 3

  addTabOptions: (args) ->
    bracketStyle = atom.config.get('formatter-astyle.TabOptions.bracketStyle').toString()
    if bracketStyle != 'default'
      args.push('--style='+bracketStyle)
    tabStyle = atom.config.get('formatter-astyle.TabOptions.tabStyle').toString()
    if tabStyle != 'default'
      indentSize = Number(atom.config.get('formatter-astyle.TabOptions.indentSize'))
      args.push('--indent='+tabStyle+'='+indentSize)
