# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/1
    class Day1a
      def initialize(input)
        @input = input
      end

      def result
        @input.lines.compact.sum { |line| value_for_line line }
      end

      def value_for_line(line)
        matches = line.scan(/\d/)

        "#{matches.first}#{matches.last}".to_i
      end
    end
  end
end
