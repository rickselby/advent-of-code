# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day03
      # https://adventofcode.com/2015/day/3
      class Part1 < AdventOfCode::Part
        def result
          positions.size
        end

        private

        def positions
          x = 0
          y = 0
          positions = Set.new
          positions << [x, y]

          single_line.chars.each do |char|
            x, y = move x, y, char
            positions << [x, y]
          end

          positions
        end

        def move(x, y, dir)
          case dir
          when "^" then [x, y - 1]
          when "v" then [x, y + 1]
          when ">" then [x + 1, y]
          when "<" then [x - 1, y]
          end
        end
      end
    end
  end
end
