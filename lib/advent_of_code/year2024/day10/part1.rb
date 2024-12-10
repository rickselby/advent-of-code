# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day10
      # https://adventofcode.com/2024/day/10
      class Part1 < AdventOfCode::Part
        def result
          starts.sum { |s| score(s) }
        end

        private

        def starts
          starts = []
          input_array.each_with_index do |row, y|
            row.each_with_index do |c, x|
              starts << Coordinate.new(x, y) if c.to_i.zero?
            end
          end
          starts
        end

        def score(start)
          finishes(start).compact.uniq(&:coords).size
        end

        def finishes(start)
          v = val(start)
          return start if v == 9

          moves(start).flat_map { |move| (val(move) == (v + 1)) ? finishes(move) : nil }
        end

        def moves(coord)
          [
            Coordinate.new(coord.x + 1, coord.y),
            Coordinate.new(coord.x - 1, coord.y),
            Coordinate.new(coord.x, coord.y + 1),
            Coordinate.new(coord.x, coord.y - 1),
          ]
        end

        def val(coord)
          return nil if coord.x.negative? || coord.y.negative?

          input_array.dig(coord.y, coord.x)&.to_i
        end

        # Store a coordinate NOT as an array!
        class Coordinate
          attr_reader :x, :y

          def initialize(x, y)
            @x = x
            @y = y
          end

          def coords
            [x, y]
          end
        end
      end
    end
  end
end
