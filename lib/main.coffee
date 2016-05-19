addCommandLineOptions = require('./config').CommmandLineOptions.properties.addCommandLineOptions
addTabOptions = require('./config').TabOptions.properties.addTabOptions
addBracketModifyOptions = require('./config').BracketModifyOptions.properties.addBracketModifyOptions
addIndentOptions = require('./config').IndentationOptions.properties.addIndentOptions
addPaddingOptions = require('./config').PaddingOptions.properties.addPaddingOptions
addFormattingOptions = require('./config').FormattingOptions.properties.addFormattingOptions
addObjectiveCOptions = require('./config').ObjectiveCOptions.properties.addObjectiveCOptions

module.exports =
  config: require './config'

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
    self = this
    child_process = require 'child_process'
    {File} = require 'atom'
    return new Promise (resolve, reject) ->
      command = atom.config.get 'formatter-astyle.CommmandLineOptions.executablePath'
      args = atom.config.get('formatter-astyle.CommmandLineOptions.arguments').toString()
      if args.length > 0
        args = args.split " "
      else
        args = []

      # addCommandLineOptions args

      addTabOptions args

      addBracketModifyOptions args

      addIndentOptions args

      addPaddingOptions args

      addFormattingOptions args

      addObjectiveCOptions args

      if args.length == 0
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
