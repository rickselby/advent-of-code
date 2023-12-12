# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day12
      # Each line in the puzzle can be handled separately
      class Line
        def initialize(line)
          p ">>> #{line}"
          @line, @groups = line.split
          @line = @line.tr(".", " ").gsub(/ +/, " ").strip
          @groups = @groups.split(",").map(&:to_i)
        end

        def possibilities
          reduce(@line, @groups)
            .then { |line, groups| count line, groups }
        end

        private

        def reduce(string, groups, reversed: false)
          p "search: #{string}, search groups: #{groups}"
          return ["", []] if groups.empty?
          return [string, groups] if smallest?(string, groups)
          return [nil, nil] if (string.start_with?("#") && string[groups.first] == "#") || !possible?(string, groups)

            # If the string starts with a #, the first group must be at the start, so remove it (and the space)
          return reduce string[groups.first + 1..].strip, groups[1..] if string.start_with? "#"

          # e.g. "??#..." and the first group is 2;
          # the # at position 3 *must* be part of the 2, so remove the first character
          return reduce string[1..], groups if string[groups.first] == "#"

          # e.g. "?#?..." and the first group is 3;
          # the 3rd character *must* be a 3 to satisfy the first group
          if groups.first != 1 && string[groups.first - 1] != "#" && string[0..groups.first - 2].include?("#")
            index = string.index "#"
            (index + 1..groups.first - 1).each { |i| string[i] = "#" }
            return reduce string, groups
          end

          # If the first group of ?# is too small for the first group, remove it
          return reduce string.split[1..].join(" "), groups if string.split[0].size < groups.first

          # Only return once we've tried the string forwards and backwards with no changes
          if reversed || string.reverse == string
            [string, groups]
          else
            reduce string.reverse, groups.reverse, reversed: true
          end
        end

        def count(string, groups, indent: 0)
          str_indent = (" " * indent)
          p "#{str_indent}counting #{string}, #{groups}"
          if string.nil?
            p "#{str_indent}possibilities: #{string}, #{groups} -> string is nil, so 0"
            return 0
          end
          if smallest?(string, groups) || groups.empty?
            p "#{str_indent}possibilities: #{string}, #{groups} -> 1"
            return 1
          end
          if groups.size == 1
            possibilities = string.split.sum { |lp| lp.size - groups.first + 1 }
            p "#{str_indent}possibilities: #{string}, #{groups} -> #{possibilities}"
            return possibilities
          end

          possibilities = 0
          new_line = string.dup
          loop do
            original_char = new_line[0]
            new_line[0] = "#"

            break unless possible? new_line, groups

            possibilities += reduce(new_line, groups).then { |l, g| count(l, g, indent: indent + 2) }
            break if original_char == "#"

            new_line = new_line[1..].strip
          end

          p "#{str_indent}possibilities: #{string}, #{groups} -> #{possibilities}"
          possibilities
        end

        def possible?(string, groups)
          return false if string.split.map(&:size).max < groups.max

          string.size >= (groups.sum + groups.size - 1)
        end

        def smallest?(string, groups)
          string.split.each_with_index.all? { |s, i| s.size == groups[i] }
        end
      end
    end
  end
end
