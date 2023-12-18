# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part1 < AdventOfCode::Day
        def result
          @coords = []
          @perimeter = 0
          parse_lines

          # Shoelace doesn't count the perimeter blocks properly; so add the extra required
          shoelace + (@perimeter / 2) + 1
        end

        private

        def parse_lines
          x = 0
          y = 0
          @coords << { x:, y: }
          lines.map(&:strip).each do |line|
            direction, distance = parse_line line
            x, y = next_coords x, y, direction, distance.to_i
            @coords << { x:, y: }
            @perimeter += distance.to_i
          end
          @coords << @coords.first
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

        # https://www.themathdoctors.org/polygon-coordinates-and-areas/
        def shoelace
          s1 = 0
          s2 = 0

          @coords.each_with_index do |coords, index|
            next if index == @coords.size - 1

            next_coords = @coords[index + 1]
            s1 += coords[:x] * next_coords[:y]
            s2 += coords[:y] * next_coords[:x]
          end

          (s1 - s2).abs * 0.5
        end
      end
    end
  end
end
