# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day10
      # https://adventofcode.com/2023/day/10
      class Part2 < Part1
        def result
          parse_map
          Algorithms::Shoelace.new(corners).without_border
        end

        private

        CORNERS = %w[J L F 7].freeze

        def corners
          corners = [@start]
          coords, direction = first_coords
          loop do
            corners << coords if CORNERS.include? @map.dig(*coords)
            coords, direction = next_move coords, direction
            break if @map.dig(*coords) == "S"
          end
          corners
        end
      end
    end
  end
end
