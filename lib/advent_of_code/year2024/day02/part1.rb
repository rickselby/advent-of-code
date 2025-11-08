# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day02
      # https://adventofcode.com/2024/day/2
      class Part1 < AdventOfCode::Part
        def result
          reports.count { safe? it }
        end

        private

        def safe?(report)
          diffs = report.each_cons(2).map { |a, b| b - a }.uniq.sort
          [1, 2, 3] & diffs == diffs || [-3, -2, -1] & diffs == diffs
        end

        def reports
          lines.map { it.split.map(&:to_i) }
        end
      end
    end
  end
end
