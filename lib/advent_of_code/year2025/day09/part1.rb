# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day09
      # https://adventofcode.com/2025/day/9
      class Part1 < AdventOfCode::Part
        def result
          @coords = read_coords
          @max_area = 0
          check_areas
          @max_area
        end

        private

        def read_coords
          lines.map { |l| l.split(",").map(&:to_i) }
        end

        def check_areas
          @coords.combination(2).each do |a, b|
            @max_area = [@max_area, (a[0] - b[0] + 1).abs * (a[1] - b[1] + 1).abs].max
          end
        end
      end
    end
  end
end
