fuzzaldrin = require 'fuzzaldrin'
minimatch = require 'minimatch'

proxy = require "../services/php-proxy.coffee"
parser = require "../services/php-file-parser.coffee"
AbstractProvider = require "./abstract-provider.coffee"

module.exports =
# Autocomplete for static methods and constants inside a class
# (keyword self::)
class SelfProvider extends AbstractProvider
  statics: []
  functionOnly: true

  ###*
   * Get suggestions from the provider (@see provider-api)
   * @return array
  ###
  fetchSuggestions: ({editor, bufferPosition, scopeDescriptor, prefix}) ->
    @regex = /(\bself::([a-zA-Z_]*))/g

    prefix = @getPrefix(editor, bufferPosition)
    return unless prefix.length

    parts = prefix.split("::")
    @statics = proxy.statics(parser.getCurrentClass(editor, bufferPosition))
    return unless @statics.names?

    suggestions = @findSuggestionsForPrefix parts[1].trim()
    return unless suggestions.length
    return suggestions

  ###*
   * Returns suggestions available matching the given prefix
   * @param {string} prefix Prefix to match
   * @return array
  ###
  findSuggestionsForPrefix: (prefix) ->
    # Filter the words using fuzzaldrin
    words = fuzzaldrin.filter @statics.names, prefix

    # Builds suggestions for the words
    suggestions = []
    for word in words
      for element in @statics.values[word]
        # Methods
        if element.isMethod
          suggestions.push
            text: word,
            type: 'method',
            snippet: @getFunctionSnippet(word, element.args),
            replacementPrefix: prefix,
            leftLabel: element.args.return,
            description: if element.args.descriptions.short? then element.args.descriptions.short else ''
            data:
              prefix: prefix,
              args: element.args

        # Constants and public properties
        else
          suggestions.push
            text: word,
            type: 'constant',
            replacementPrefix: prefix,
            data:
              prefix: prefix

    return suggestions
