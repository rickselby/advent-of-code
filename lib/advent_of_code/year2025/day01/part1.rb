# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day01
      # https://adventofcode.com/2025/day/1
      class Part1 < AdventOfCode::Part
        def result
          @dial = 50
          count = 0
          lines.each do |line|
            parts = /([LR])(\d+)/.match line
            rotate parts[1], parts[2].to_i
            count += 1 if @dial.zero?
          end
          count
        end

        private

        def rotate(direction, amount)
          case direction
          when "L" then @dial -= amount
          when "R" then @dial += amount
          end
          @dial %= 100
        end
      end
    end
  end
end
