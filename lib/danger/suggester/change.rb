require 'git_diff'

module Danger
  module Suggester
    class Change
      # @param [Array<GitDiff::Line::Context>] chunks
      def initialize(chunks)
        @chunks = chunks
      end

      # @return [String]
      def added_content
        added_lines.map do |line|
          line.content[1..-1]
        end.join("\n")
      end

      # @return [Integer]
      def first_line_number
        @chunks.first.line_number.left
      end

      # @return [Boolean]
      def suggestible?
        deleted_lines.count == 1
      end

      private

      def added_lines
        @chunks.drop_while do |line|
          line.is_a?(::GitDiff::Line::Deletion)
        end
      end

      # @return [Integer]
      def deleted_lines
        @chunks.take_while do |line|
          line.is_a?(::GitDiff::Line::Deletion)
        end
      end
    end
  end
end
