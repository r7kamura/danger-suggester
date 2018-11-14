require 'danger/suggester/change'
require 'git_diff'

module Danger
  module Suggester
    class Hunk
      # @param [GitDiff::Hunk] hunk
      def initialize(hunk)
        @hunk = hunk
      end

      # @return [Array<Danger::Suggester::Change>]
      def changes
        chunks_without_context.map do |chunk|
          ::Danger::Suggester::Change.new(chunk)
        end
      end

      # @return [Array<Array<GitDiff::Line::Context>>]
      def chunks
        @hunk.lines.chunk_while do |a, b|
          a.instance_of?(::GitDiff::Line::Context) && b.instance_of?(::GitDiff::Line::Context) ||
            a.instance_of?(::GitDiff::Line::Deletion) && b.instance_of?(::GitDiff::Line::Deletion) ||
            a.instance_of?(::GitDiff::Line::Deletion) && b.instance_of?(::GitDiff::Line::Addition) ||
            a.instance_of?(::GitDiff::Line::Addition) && b.instance_of?(::GitDiff::Line::Addition)
        end
      end

      # @return [Array<Array<GitDiff::Line::Context>>]
      def chunks_without_context
        chunks.reject do |chunk|
          chunk.first.instance_of?(::GitDiff::Line::Context)
        end
      end
    end
  end
end
