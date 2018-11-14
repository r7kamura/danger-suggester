module Danger
  module Suggester
    class Suggestion
      # @return [Integer]
      attr_reader :line

      # @param [String]
      attr_reader :path

      # @param [String] content
      # @param [Integer] line
      # @param [String] path
      def initialize(content:, line:, path:)
        @content = content
        @line = line
        @path = path
      end

      # @return [String]
      def message
        "```suggestion\n#{@content}\n```"
      end
    end
  end
end
