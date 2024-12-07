# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day04
      # https://adventofcode.com/2024/day/4
      class Part2 < AdventOfCode::Part
        def result
          grids.count { |g| match? g }
        end

        private

        def grids
          grids = []
          (input_array.first.size - 2).times { |x| (input_array.size - 2).times { |y| grids << grid(x, y) } }
          grids
        end

        def grid(x, y)
          [input_array[y][x..(x + 2)], input_array[y + 1][x..(x + 2)], input_array[y + 2][x..(x + 2)]]
        end

        def match?(grid)
          return false unless grid[1][1] == "A"
          return false unless [grid[0][0], grid[0][2], grid[2][0], grid[2][2]].sort == %w[M M S S]
          return false if grid[0][0] == grid[2][2]

          true
        end
      end
    end
  end
end
