# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day14
      # https://adventofcode.com/2024/day/14
      class Part1 < AdventOfCode::Part
        SECONDS = 100

        def initialize(input, width = 101, height = 103)
          super(input)
          @width = width
          @height = height
        end

        def result
          lines.map { |l| final_pos l }
               .reject { |c| in_middle? c }
               .partition { |c| c[0] < x_mid }
               .map { |a| a.partition { |c| c[1] < y_mid } }
               .map { |a| a.map(&:size).reduce(1, :*) }
               .reduce(1, &:*)
        end

        private

        def final_pos(line)
          x, y, vx, vy = line.scan(/-?\d+/).map(&:to_i)
          vx *= SECONDS
          vy *= SECONDS
          [(x + vx) % @width, (y + vy) % @height]
        end

        def in_middle?(coords)
          coords[0] == x_mid || coords[1] == y_mid
        end

        def x_mid
          @x_mid ||= @width / 2
        end

        def y_mid
          @y_mid ||= @height / 2
        end
      end
    end
  end
end
