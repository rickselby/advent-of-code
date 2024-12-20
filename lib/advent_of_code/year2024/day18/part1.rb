# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day18
      # https://adventofcode.com/2024/day/18
      class Part1 < AdventOfCode::Part
        def initialize(input, size = 70, bytes = 1024)
          super(input)
          @size = size
          @bytes = bytes
        end

        def result
          @map = AdventOfCode::Helpers::Map.new(make_map)
          add_blocks @bytes
          start = AdventOfCode::Helpers::Coordinates.new(0, 0)
          @costs = { start => 0 }
          @check = [start]
          find_route
          @costs[AdventOfCode::Helpers::Coordinates.new(@size, @size)]
        end

        private

        def make_map
          map = []
          (@size + 1).times { map << Array.new(@size + 1, " ") }
          map
        end

        def add_blocks(limit)
          lines.first(limit).each do |line|
            @map.set(AdventOfCode::Helpers::Coordinates.new(*line.split(",").map(&:to_i)), "#")
          end
        end

        def find_route
          loop do
            c = @check.shift
            cost = @costs[c]

            c.adjacent.each { |neighbor| check_next_coord neighbor, cost + 1 }

            break if @check.empty?
          end
        end

        def check_next_coord(coord, cost)
          return if @map.out_of_range? coord
          return if @map[coord] == "#"
          return if @costs.key?(coord) && @costs[coord] <= cost

          @costs[coord] = cost
          @check << coord
        end
      end
    end
  end
end
