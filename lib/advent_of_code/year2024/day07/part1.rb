# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day07
      # https://adventofcode.com/2024/day/7
      class Part1 < AdventOfCode::Day
        def result
          lines.sum { |l| test l }
        end

        private

        def test(line)
          expected, values = line.split ":"
          expected = expected.to_i
          values = values.split.map(&:to_i)

          do_sums expected, 0, values
        end

        def do_sums(expected, current, remaining)
          remaining = remaining.dup

          return (expected == current) ? expected : 0 if remaining.empty?

          value = remaining.shift
          %i[+ *].each do |operator|
            v = do_sums(expected, [current, value].reduce(operator), remaining)
            return v if v != 0
          end

          0
        end
      end
    end
  end
end
