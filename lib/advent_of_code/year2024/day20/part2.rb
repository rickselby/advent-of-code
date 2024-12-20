# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day20
      # https://adventofcode.com/2024/day/20
      class Part2 < Part1
        def result
          @map = AdventOfCode::Helpers::Map.new input_array
          @cuts = []
          set_route
          find_cuts
          @cuts.count { |v| v >= @min_save }
        end

        private

        def find_cuts
          @map.each_coord do |c|
            next unless @map[c].is_a? Integer

            @cuts += CutsFrom.new(@map, c).cuts
          end
        end

        # Find a list of cuts from a given coordinate
        class CutsFrom
          def initialize(map, coords)
            @map = map
            @coords = coords
            @start_value = @map[coords]
            @visited = Set.new [coords]
            @cuts = []
          end

          def cuts
            find_cuts
            @cuts
          end

          private

          def find_cuts
            list = @visited.dup
            (1..20).each do |i|
              next_list = Set.new
              list.each { |c| next_list += check_coords c, i }
              list = next_list
            end
          end

          def check_coords(coords, depth)
            next_list = Set.new
            coords.adjacent.map do |ac|
              next if @map.out_of_range?(ac) || @visited.include?(ac)

              @visited << ac
              next_list << ac
              next unless @map[ac].is_a? Integer

              @cuts << (@map[ac] - @start_value - depth)
            end
            next_list
          end
        end
      end
    end
  end
end
