# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day01
      # https://adventofcode.com/2025/day/1
      class Part2 < AdventOfCode::Part
        def result
          @dial = 50
          @count = 0
          lines.each do |line|
            rotate_and_check_dial(*/([LR])(\d+)/.match(line).captures)
          end
          @count
        end

        private

        def rotate_and_check_dial(direction, amount)
          dial_was_zero = @dial.zero?
          rotate direction, amount
          zeroes, @dial = @dial.divmod 100
          zeroes = zeroes.abs
          if direction == "L"
            zeroes -= 1 if dial_was_zero
            zeroes += 1 if @dial.zero?
          end
          @count += zeroes
        end

        def rotate(direction, amount)
          case direction
          when "L" then @dial -= amount.to_i
          when "R" then @dial += amount.to_i
          end
        end
      end
    end
  end
end
