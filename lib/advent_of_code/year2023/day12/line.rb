# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day12
      # Each line in the puzzle can be handled separately
      class Line
        def initialize(line)
          @line, @groups = line.split
          @line = @line.tr(".", " ").squeeze(" ").strip
          @groups = @groups.split(",").map(&:to_i)
        end

        def possibilities
          count @line, @groups
        end

        private

        def count(string, groups, index = 0)
          if index == string.size
            return groups(string) == groups ? 1 : 0
          end

          return count(string, groups, index + 1) unless string[index] == "?"

          a = replace_and_count string, groups, index, "#"
          b = replace_and_count string, groups, index, " "

          a + b
        end

        def replace_and_count(string, groups, index, character)
          string.dup.then { |s| replace_char s, index, character }.then { |s| count s, groups, index }
        end

        def replace_char(string, index, character)
          string[index] = character
          string
        end

        def groups(string)
          string.tr("?", " ").split.map(&:size)
        end
      end
    end
  end
end
