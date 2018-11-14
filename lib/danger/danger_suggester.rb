require 'danger'
require 'danger/suggester/file'
require 'danger/suggester/suggestion'
require 'git_diff'

module Danger
  class DangerSuggester < ::Danger::Plugin
    def suggest
      suggestions_for_added_lines.each do |suggestion|
        markdown(
          suggestion.message,
          file: suggestion.path,
          line: suggestion.line
        )
      end
    end

    private

    # @return [Hash{String => Array<Integer>}]
    def added_lines_in_commits
      @added_lines_in_commits ||= begin
        origin = ::Hash.new do |hash, key|
          hash[key] = []
        end
        ::GitDiff.from_string(diff_string_from_commits).files.each_with_object(origin) do |file, result|
          result[file.b_path] = file.hunks.flat_map do |hunk|
            hunk.lines.grep(::GitDiff::Line::Addition).map do |line|
              line.line_number.right
            end
          end
        end
      end
    end

    # @return [String]
    def diff_string_from_commits
      git.diff.patch
    end

    # @return [String]
    def diff_string_from_unstaged_changes
      `git diff`
    end

    # @return [Array<Danger::Suggester::File>]
    def files
      ::GitDiff.from_string(diff_string_from_unstaged_changes).files.map do |file|
        ::Danger::Suggester::File.new(file)
      end
    end

    # @return [Array<Danger::Suggester::Suggestion>]
    def suggestions_for_added_lines
      suggestions_for_unstaged_changes.select do |suggestion|
        added_lines_in_commits[suggestion.path].include?(suggestion.line)
      end
    end

    # @return [Array<Danger::Suggester::Suggestion>]
    def suggestions_for_unstaged_changes
      files.select(&:suggestible?).flat_map do |file|
        file.changes.select(&:suggestible?).map do |change|
          ::Danger::Suggester::Suggestion.new(
            content: change.added_content,
            line: change.first_line_number,
            path: file.a_path
          )
        end
      end
    end
  end
end
