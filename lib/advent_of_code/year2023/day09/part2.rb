# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day09
      # https://adventofcode.com/2023/day/9
      class Part2 < AdventOfCode::Part
        def result
          lines.sum { |l| prev_diff l.split.map(&:to_i) }
        end

        def prev_diff(value_list)
          diffs = []
          value_list.each_cons(2) { |a, b| diffs << (b - a) }
          prev_diff = diffs.all?(&:zero?) ? 0 : prev_diff(diffs)
          value_list.first - prev_diff
        end
      end
    end
  end
end
