# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day16
      # https://adventofcode.com/2023/day/16
      class Part2 < Part1
        def result
          all_starts.reduce(0) do |max, (x, y, direction)|
            @checked = Set.new
            energise x, y, direction
            [max, coords_only.size].max
          end
        end

        private

        def all_starts
          rows + cols
        end

        def rows
          max_y = input_array.size - 1
          Array.new(input_array[0].size) { [[it, 0, :south], [it, max_y, :north]] }.flatten(1)
        end

        def cols
          max_x = input_array[0].size - 1
          Array.new(input_array.size) { [[0, it, :east], [max_x, it, :west]] }.flatten(1)
        end
      end
    end
  end
end
