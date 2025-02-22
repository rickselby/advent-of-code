# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day20
      # https://adventofcode.com/2024/day/20
      class Part1 < AdventOfCode::Part
        def initialize(input, min_save = 100)
          super(input)
          @min_save = min_save
        end

        def result
          @map = AdventOfCode::Helpers::Map.new input_array
          @cuts = []
          set_route
          find_cuts
          @cuts.count { |v| v >= @min_save }
        end

        private

        MOVES = %w[E .].freeze
        private_constant :MOVES

        def set_route
          coords = @map.find "S"
          cost = 0
          loop do
            @map.set coords, cost

            next_coords = coords.adjacent.select { |c| MOVES.include? @map[c] }
            break if next_coords.empty?

            coords = next_coords.first
            cost += 1
          end
        end

        def find_cuts
          @map.each_coord do |coord|
            values = coord.adjacent.filter_map { |c| @map[c] }.reject { |v| v == "#" }
            next if values.size < 2

            @cuts << (values.max - values.min - 2)
          end
        end
      end
    end
  end
end
