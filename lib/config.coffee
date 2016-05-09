module.exports =
    CommmandLineOptions:
      type: 'object'
      description: 'Specify the command line options and executable path.'
      order: 1
      properties: require '../conf/commmandLineOptions'

    TabOptions:
      type: 'object'
      order: 2
      properties: require '../conf/tabOptions'

    BracketModifyOptions:
      type: 'object'
      order: 3
      properties: require '../conf/bracketModifyOptions'

    IndentationOptions:
      type: 'object'
      order: 4
      properties: require '../conf/indentationOptions'

    PaddingOptions:
      type: 'object'
      order: 5
      properties: require '../conf/paddingOptions'

    FormattingOptions:
      type: 'object'
      order: 6
      properties: require '../conf/formattingOptions'

    ObjectiveCOptions:
      type: 'object'
      order: 7
      properties: require '../conf/objective-COptions'
