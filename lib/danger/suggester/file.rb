require 'danger/suggester/hunk'

module Danger
  module Suggester
    class File
      # @param [GitDiff::File] file
      def initialize(file)
        @file = file
      end

      # @return [String]
      def a_path
        @file.a_path
      end

      # @return [Array<Danger::Suggester::Change>]
      def changes
        hunks.flat_map(&:changes)
      end

      # @return [Boolean]
      def suggestible?
        !renamed?
      end

      private

      # @return [Array<Danger::Suggester::Hunk>]
      def hunks
        @file.hunks.map do |hunk|
          ::Danger::Suggester::Hunk.new(hunk)
        end
      end

      # @return [Boolean]
      def renamed?
        @file.a_path != @file.b_path
      end
    end
  end
end
