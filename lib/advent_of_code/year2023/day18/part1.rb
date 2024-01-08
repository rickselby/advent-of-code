# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part1 < AdventOfCode::Day
        def result
          @coords = []
          parse_lines
          Algorithms::Shoelace.new(@coords).with_border
        end

        private

        def parse_lines
          x = 0
          y = 0
          @coords << [x, y]
          lines.map(&:strip).each do |line|
            direction, distance = parse_line line
            x, y = next_coords x, y, direction, distance.to_i
            @coords << [x, y]
          end
        end

        def parse_line(line)
          bits = line.split
          [bits[0], bits[1]]
        end

        def next_coords(x, y, direction, distance)
          case direction
          when "U" then [x, y - distance]
          when "R" then [x + distance, y]
          when "D" then [x, y + distance]
          when "L" then [x - distance, y]
          end
        end
      end
    end
  end
end
