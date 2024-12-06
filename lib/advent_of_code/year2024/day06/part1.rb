# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day06
      # https://adventofcode.com/2024/day/6
      class Part1 < AdventOfCode::Day
        def result
          parse_map
          @dir = :up
          walk
          count
        end

        private

        ROTATE = {
          up:    :right,
          right: :down,
          down:  :left,
          left:  :up,
        }.freeze

        def parse_map
          @map = {}
          lines.each_with_index do |line, row|
            line.chars.each_with_index do |char, col|
              @map[row] ||= {}
              @map[row][col] = char
              @pos = [row, col] if char == "^"
            end
          end
        end

        def walk
          loop do
            @map[@pos[0]][@pos[1]] = "X"

            if @map.dig(*next_pos) == "#"
              rotate
            else
              @pos = next_pos
            end

            break if out_of_bounds?
          end
        end

        def next_pos
          case @dir
          when :up then [@pos[0] - 1, @pos[1]]
          when :down then [@pos[0] + 1, @pos[1]]
          when :left then [@pos[0], @pos[1] - 1]
          when :right then [@pos[0], @pos[1] + 1]
          end
        end

        def rotate
          @dir = ROTATE[@dir]
        end

        def max_x
          @max_x ||= lines.first.size
        end

        def max_y
          @max_y ||= lines.size
        end

        def out_of_bounds?
          @pos[0].negative? || @pos[0] >= max_x || @pos[1].negative? || @pos[1] >= max_y
        end

        def count
          @map.values.sum { |r| r.values.select { |c| c == "X" }.size }
        end
      end
    end
  end
end
