# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day03
      # https://adventofcode.com/2025/day/3
      class Part2 < Part1
        private

        def joltage(line)
          number = ""
          left = 0
          (1..12).reverse_each do |i|
            arr = line[left..(-i)]
            val = arr.max
            left = left + arr.find_index(val) + 1
            number = "#{number}#{val}"
          end
          number.to_i
        end
      end
    end
  end
end
