# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part2 < Part1
        private

        DIRECTIONS = { "0" => "R", "1" => "D", "2" => "L", "3" => "U" }.freeze
        private_constant :DIRECTIONS

        def parse_line(line)
          hex_string = line.split.last
          hex_number = hex_string[2..6]
          direction_code = hex_string[7]
          [DIRECTIONS[direction_code], hex_number.to_i(16)]
        end
      end
    end
  end
end
