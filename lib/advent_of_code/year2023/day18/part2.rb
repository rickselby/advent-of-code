# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part2 < Part1
        private

        DIRECTIONS = { "0" => "R", "1" => "D", "2" => "L", "3" => "U" }.freeze

        def parse_line(line)
          bits = line.split
          str = bits[2]
          hex = str[2..6]
          dir = str[7]
          [DIRECTIONS[dir], hex.to_i(16)]
        end
      end
    end
  end
end
