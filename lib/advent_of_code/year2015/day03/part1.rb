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
          santa = [0, 0]
          positions = Set.new
          positions << santa

          chars.each do |char|
            santa = move santa, char
            positions << santa
          end

          positions
        end

        def move(pos, dir)
          case dir
          when "^" then [pos[0], pos[1] - 1]
          when "v" then [pos[0], pos[1] + 1]
          when ">" then [pos[0] + 1, pos[1]]
          when "<" then [pos[0] - 1, pos[1]]
          end
        end
      end
    end
  end
end
