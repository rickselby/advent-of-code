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
          lines.map { final_pos it }
               .reject { in_middle? it }
               .partition { it[0] < x_mid }
               .map { partition_and_count_and_multiply it }
               .reduce(1, :*)
        end

        private

        def partition_and_count_and_multiply(array)
          array.partition { it[1] < y_mid }.map(&:size).reduce(1, :*)
        end

        def final_pos(line)
          x, y, vx, vy = line.scan(/-?\d+/).map(&:to_i)
          vx *= self.class::SECONDS
          vy *= self.class::SECONDS
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
