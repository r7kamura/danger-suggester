module Danger
  module Suggestion
    class Suggestion
      # @return [Integer]
      attr_reader :line

      # @param [String]
      attr_reader :path

      # @param [Integer] line
      # @param [String] path
      def initialize(line:, path:)
        @line = line
        @path = path
      end

      # @return [String]
      def message
        <<~STRING
          ```suggestion
          #{code_after_change}
          ```
        STRING
      end

      private

      # @todo
      # @return [String]
      def code_after_change
        'dummy'
      end
    end
  end
end
