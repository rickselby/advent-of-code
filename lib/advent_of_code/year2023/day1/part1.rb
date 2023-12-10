# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day1
      # https://adventofcode.com/2023/day/1
      class Part1 < AdventOfCode::Day
        def result
          @input.lines.sum { |line| value_for_line line }
        end

        def value_for_line(line)
          # Find all digits in the string
          matches = line.scan(/\d/)

          "#{matches.first}#{matches.last}".to_i
        end
      end
    end
  end
end
