# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day04
      # https://adventofcode.com/2025/day/4
      class Part1 < AdventOfCode::Part
        def result
          @map = AdventOfCode::Helpers::Map.new(input_array)

          @map.all_coords.count { accessible? it }
        end

        private

        def accessible?(coord)
          return false unless @map[coord] == "@"

          coord.adjacent_plus_diagonals.select { @map[it] == "@" }.count < 4
        end
      end
    end
  end
end
