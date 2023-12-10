# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/6
    class Day6b < Day6a
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
