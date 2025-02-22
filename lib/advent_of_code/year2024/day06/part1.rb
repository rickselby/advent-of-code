# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day06
      # https://adventofcode.com/2024/day/6
      class Part1 < AdventOfCode::Part
        def result
          count walk(*parse_map, :up)
        end

        private

        ROTATE = {
          up:    :right,
          right: :down,
          down:  :left,
          left:  :up,
        }.freeze
        private_constant :ROTATE

        def parse_map
          map = {}
          start = nil

          lines.each_with_index do |line, row|
            line.chars.each_with_index do |char, col|
              map[row] ||= {}
              map[row][col] = char
              start = [row, col] if char == "^"
            end
          end

          [map, start]
        end

        def walk(map, pos, dir)
          loop do
            map[pos[0]][pos[1]] = "X"
            pos, dir = move map, pos, dir

            break if out_of_bounds? pos
          end

          map
        end

        def move(map, pos, dir)
          if map.dig(*next_pos(pos, dir)) == "#"
            dir = ROTATE[dir]
          else
            pos = next_pos(pos, dir)
          end

          [pos, dir]
        end

        def next_pos(pos, dir)
          case dir
          when :up then [pos[0] - 1, pos[1]]
          when :down then [pos[0] + 1, pos[1]]
          when :left then [pos[0], pos[1] - 1]
          when :right then [pos[0], pos[1] + 1]
          end
        end

        def max_x
          @max_x ||= lines.first.size
        end

        def max_y
          @max_y ||= lines.size
        end

        def out_of_bounds?(pos)
          pos[0].negative? || pos[0] >= max_x || pos[1].negative? || pos[1] >= max_y
        end

        def count(map)
          map.values.sum { |r| r.values.select { |c| c == "X" }.size }
        end
      end
    end
  end
end
