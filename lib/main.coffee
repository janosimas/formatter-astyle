module.exports =
  config:
    executablePath:
      title: 'Path to the exectuable'
      type: 'string'
      default: 'astyle'
    arguments:
      title: 'Arguments passed to the formatter'
      type: 'array'
      default: []

  provideFormatter: ->
    [
      {
        selector: '.source.c'
        getNewText: @format
      }
      {
        selector: '.source.cpp'
        getNewText: @format
      }
      {
        selector: '.source.objc'
        getNewText: @format
      }
    ]

  format: (text) ->
    child_process = require 'child_process'
    {File} = require 'atom'
    return new Promise (resolve, reject) ->
      command = atom.config.get 'formatter-astyle.executablePath'
      args = atom.config.get 'formatter-astyle.arguments'
      if args.toString().length > 0
        args = args.toString().split " "
      else
        args = []

      projectPaths = atom.project.getPaths()
      for projectPath in projectPaths
        confPath = new File(projectPath+'/.astylerc')
        if confPath.existsSync()
          args.push('--options='+confPath.getPath())

      console.log args
      toReturn = []
      process = child_process.spawn(command, args, {})
      process.stdout.on 'data', (data) -> toReturn.push data
      process.stdin.write text
      process.stdin.end()
      process.on 'close', ->
        resolve(toReturn.join('\n'))
