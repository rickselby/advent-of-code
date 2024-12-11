# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day11
      # https://adventofcode.com/2024/day/11
      class Part2 < Part1
        def result(count = 75)
          multi_blink(stones, count).values.sum
        end

        def blink(stones)
          new_stones = {}
          stones.each_pair do |stone, count|
            Array(change(stone)).each do |v|
              new_stones[v] ||= 0
              new_stones[v] += count
            end
          end
          new_stones
        end

        private

        def stones
          super.to_h { |v| [v, 1] }
        end
      end
    end
  end
end
