{File} = require 'atom'

findOptionsFilePath = () ->
  projectPaths = atom.project.getPaths()
  for projectPath in projectPaths
    confPath = new File(projectPath+'/.astylerc')
    if confPath.existsSync()
      return confPath.getPath()
  return ''

module.exports =
  executablePath:
    title: 'Path to the exectuable'
    type: 'string'
    default: 'astyle'
    order: 1
  clOptions:
    title: 'Options file'
    type: 'string'
    default: findOptionsFilePath()
    order: 2
  arguments:
    title: 'Command line arguments'
    type: 'array'
    default: []
    order: 3

addCommandLineOptions: (args) ->
  clOptions = atom.config.get('formatter-astyle.CommmandLineOptions.clOptions').toString()
  if clOptions
    args.push('--options='+clOptions)
  
