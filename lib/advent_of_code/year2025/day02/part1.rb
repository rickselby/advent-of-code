# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day02
      # https://adventofcode.com/2025/day/2
      class Part1 < AdventOfCode::Part
        def result
          sum = 0
          ranges.each do |range|
            start, stop = range.split "-"
            (start.to_i..stop.to_i).each do |num|
              sum += num if repeated?(num)
            end
          end
          sum
        end

        private

        def ranges
          single_line.split ","
        end

        def repeated?(num)
          str = num.to_s
          return false unless str.length.even?

          first, second = str.chars.each_slice(str.length / 2).map(&:join)

          first == second
        end
      end
    end
  end
end
