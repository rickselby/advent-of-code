# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/9
    class Day9a
      def initialize(input)
        @input = input
      end

      def result
        @input.lines
              .sum { |l| next_diff l.split.map(&:to_i) }
      end

      def next_diff(value_list)
        diffs = []
        value_list.each_cons(2) { |a, b| diffs << (b - a) }
        next_diff = diffs.all?(&:zero?) ? 0 : next_diff(diffs)
        value_list.last + next_diff
      end
    end
  end
end
