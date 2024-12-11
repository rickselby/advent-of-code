# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day11
      # https://adventofcode.com/2024/day/11
      class Part1 < AdventOfCode::Part
        def result
          multi_blink(stones, 25).size
        end

        def multi_blink(stones, count)
          count.times { stones = blink(stones) }
          stones
        end

        def blink(stones)
          stones.flat_map { |s| change s }
        end

        private

        def change(stone)
          return 1 if stone.zero?

          str = stone.to_s
          return str.chars.each_slice(str.length / 2).map { |a| a.join.to_i } if str.length.even?

          stone * 2024
        end

        def stones
          single_line.split.map(&:to_i)
        end
      end
    end
  end
end
