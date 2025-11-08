# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day09
      # https://adventofcode.com/2023/day/9
      class Part1 < AdventOfCode::Part
        def result
          lines.sum { next_diff it.split.map(&:to_i) }
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
end
