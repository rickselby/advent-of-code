# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day16
      # https://adventofcode.com/2023/day/16
      class Part1 < AdventOfCode::Day
        def result
          @energised = []
          @checked = []
          energise 0, 0, :east
          @energised.uniq.size
        end

        private

        def energise(x, y, direction)
          return if @checked.include? [x, y, direction]
          return if invalid_coordinates? x, y

          @energised << [x, y]
          @checked << [x, y, direction]

          move x, y, direction
        end

        def move(x, y, direction)
          case input_array[y][x]
          when "." then energise(*continue(x, y, direction))
          when "-" then splitter(x, y, direction, %i[east west])
          when "|" then splitter(x, y, direction, %i[north south])
          when "\\", "/" then mirror(x, y, direction, input_array[y][x])
          end
        end

        def continue(x, y, direction)
          case direction
          when :north then [x, y - 1, direction]
          when :east then [x + 1, y, direction]
          when :south then [x, y + 1, direction]
          when :west then [x - 1, y, direction]
          end
        end

        def splitter(x, y, direction, passthrough)
          return energise(*continue(x, y, direction)) if passthrough.include? direction

          energise(*continue(x, y, TURNS[direction][:left]))
          energise(*continue(x, y, TURNS[direction][:right]))
        end

        TURNS = {
          north: { left: :west, right: :east },
          east: { left: :north, right: :south },
          south: { left: :east, right: :west },
          west: { left: :south, right: :north }
        }.freeze

        def mirror(x, y, direction, mirror)
          energise(*continue(x, y, MIRRORS[mirror][direction]))
        end

        MIRRORS = {
          "/" => {
            north: :east,
            east: :north,
            south: :west,
            west: :south
          },
          "\\" => {
            north: :west,
            east: :south,
            south: :east,
            west: :north
          }
        }.freeze

        def invalid_coordinates?(x, y)
          x.negative? || y.negative? || y == input_array.size || x == input_array[0].size
        end
      end
    end
  end
end
