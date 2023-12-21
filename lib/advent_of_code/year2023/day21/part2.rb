# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day21
      # https://adventofcode.com/2023/day/21
      class Part2 < Part1
        def result
          steps 26_501_365
        end

        def steps(steps)
          coords_list = {}
          coords_list[@start] = [[0, 0]]
          steps.times do
            coords_list = find_moves coords_list
          end
          coords_list.values.sum(&:size)
        end

        private

        def find_moves(coords_list)
          new_list = {}
          coords_list.each do |coords, maps|
            possible_coords(coords).each do |poss|
              next if rock? poss

              if new_map poss
                these_maps = translate_maps maps, poss
                poss = translate poss
              else
                these_maps = maps
              end

              new_list[poss] = if new_list.key? poss
                                 (new_list[poss] + these_maps).uniq
                               else
                                 these_maps
                               end
            end
          end
          new_list
        end

        def rock?(coords)
          x, y = translate coords
          @map[y][x] == "#"
        end

        def new_map(coords)
          coords[0].negative? || coords[1].negative? || coords[0] >= max_x || coords[1] >= max_y
        end

        def translate(coords)
          [
            coords[0] % max_x,
            coords[1] % max_y
          ]
        end

        def translate_maps(maps, coords)
          maps.map { |m| translate_map m, coords }
        end

        def translate_map(map, coords)
          return [map[0] - 1, map[1]] if coords[0].negative?
          return [map[0], map[1] - 1] if coords[1].negative?
          return [map[0] + 1, map[1]] if coords[0] >= max_x

          [map[0], map[1] + 1] if coords[1] >= max_y
        end
      end
    end
  end
end
