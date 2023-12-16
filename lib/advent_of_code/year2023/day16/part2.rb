# frozen_string_literal: true

require "benchmark"

class AdventOfCode
  module Year2023
    module Day16
      # https://adventofcode.com/2023/day/16
      class Part2 < Part1
        def result
          max = 0
          all_starts.each do |x, y, direction|
            @energised = []
            @checked = []
            energise x, y, direction
            max = [max, @energised.uniq.size].max
          end
          max
        end

        private

        def all_starts
          top_row + bottom_row + left_col + right_col
        end

        def top_row
          Array.new(input_array[0].size) { |x| [x, 0, :south] }
        end

        def bottom_row
          Array.new(input_array[0].size) { |x| [x, input_array.size - 1, :north] }
        end

        def left_col
          Array.new(input_array.size) { |y| [0, y, :east] }
        end

        def right_col
          Array.new(input_array.size) { |y| [input_array[0].size - 1, y, :west] }
        end
      end
    end
  end
end
