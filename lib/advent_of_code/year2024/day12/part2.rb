# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day12
      # https://adventofcode.com/2024/day/12
      class Part2 < Part1
        private

        def new_region(coords)
          Region.new val coords
        end

        # Save each region as an object
        class Region < Part1::Region
          def initialize(tag)
            super
            @horizontals = {}
            @verticals = {}
          end

          def value
            init_sides
            count_sides
            area * sides
          end

          private

          def init_sides
            coords.each do |c|
              @horizontals[c[0]] = { top: [], bottom: [] }
              @verticals[c[1]] = { left: [], right: [] }
            end
          end

          def count_sides
            coords.each do |c|
              adjacent_coords(c).each do |dir, ac|
                next if coords.include? ac

                add_side c, dir
              end
            end
          end

          def add_side(coords, dir)
            case dir
            when :top, :bottom then @horizontals[coords[0]][dir] << coords[1]
            when :left, :right then @verticals[coords[1]][dir] << coords[0]
            end
          end

          def sides
            sum_sides(@horizontals) + sum_sides(@verticals)
          end

          def sum_sides(sides)
            sides.values.sum { |s| s.values.sum { |h| h.sort.slice_when { |a, b| a != b - 1 }.to_a.size } }
          end

          def adjacent_coords(coords)
            {
              top:    [coords[0] - 1, coords[1]],
              bottom: [coords[0] + 1, coords[1]],
              left:   [coords[0], coords[1] - 1],
              right:  [coords[0], coords[1] + 1],
            }
          end
        end
      end
    end
  end
end
