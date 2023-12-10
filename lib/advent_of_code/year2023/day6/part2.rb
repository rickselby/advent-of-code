# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day6
      # https://adventofcode.com/2023/day/6
      class Part2 < Part1
        private

        def parse_input(input)
          @input = [
            {
              time: get_value(input.lines[0]),
              distance: get_value(input.lines[1])
            }
          ]
        end

        def get_value(line)
          line.split(":")[1].strip.split.map(&:strip).join.to_i
        end
      end
    end
  end
end