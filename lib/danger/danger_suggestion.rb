require 'danger'
require 'danger/suggestion/suggestion'

module Danger
  class DangerSuggestion < ::Danger::Plugin
    def lint
      suggestions.each do |suggestion|
        markdown(
          suggestion.message,
          file: suggestion.path,
          line: suggestion.line,
        )
      end
    end

    private

    # @todo
    # @return [Array<Danger::Suggestion::Suggestion>]
    def suggestions
      [
        ::Danger::Suggestion::Suggestion.new(
          line: 1,
          path: 'lib/danger/danger_suggestion.rb',
        )
      ]
    end
  end
end
