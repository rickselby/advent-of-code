# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day18
      # https://adventofcode.com/2024/day/18
      class Part2 < Part1
        def result
          @map = AdventOfCode::Helpers::Map.new(make_map)

          @start = AdventOfCode::Helpers::Coordinates.new(0, 0)
          @target = AdventOfCode::Helpers::Coordinates.new(@size, @size)

          @last = nil
          check_drops

          lines[@last - 1]
        end

        private

        def check_drops
          (1..lines.size).each do |i|
            @costs = { @start => 0 }
            @check = [@start]
            add_blocks i
            find_route

            @last = i
            break unless @costs.key? @target
          end
        end

        def find_route
          loop do
            c = @check.shift
            cost = @costs[c]

            c.adjacent.each { check_next_coord it, cost + 1 }

            break if @check.empty?
            break if @costs.key? @target
          end
        end
      end
    end
  end
end
