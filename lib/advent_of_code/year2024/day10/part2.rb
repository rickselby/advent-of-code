# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day10
      # https://adventofcode.com/2024/day/10
      class Part2 < Part1
        private

        def score(start)
          finishes(start).compact.size
        end

        def finishes(start)
          v = val(start)
          return 9 if v == 9

          moves(start).flat_map { (val(it) == (v + 1)) ? finishes(it) : nil }
        end
      end
    end
  end
end
