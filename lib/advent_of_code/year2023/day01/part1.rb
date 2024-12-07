# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day01
      # https://adventofcode.com/2023/day/1
      class Part1 < AdventOfCode::Part
        def result
          lines.sum { |line| value_for_line line }
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
