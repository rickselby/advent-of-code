# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day21
      # https://adventofcode.com/2023/day/21
      class Part1 < AdventOfCode::Part
        def initialize(input)
          super
          @map = lines.each_with_index.map do |l, i|
            @start = [l.index("S"), i] if l.index("S")
            l.strip.chars
          end
        end

        def result
          steps 64
        end

        def steps(steps)
          coords_list = Set.new
          coords_list << @start
          steps.times do
            coords_list = find_moves coords_list
          end
          coords_list.size
        end

        private

        def find_moves(coords_list)
          new_list = Set.new
          coords_list.each do |coords|
            possible_coords(coords).each do |poss|
              next if invalid_coords? poss

              new_list << poss unless @map[poss[1]][poss[0]] == "#"
            end
          end
          new_list
        end

        def possible_coords(coords)
          [
            [coords[0], coords[1] + 1],
            [coords[0], coords[1] - 1],
            [coords[0] + 1, coords[1]],
            [coords[0] - 1, coords[1]],
          ]
        end

        def invalid_coords?(coords)
          coords[0].negative? || coords[1].negative? || coords[0] >= @map[0].size || coords[1] >= @map.size
        end
      end
    end
  end
end
