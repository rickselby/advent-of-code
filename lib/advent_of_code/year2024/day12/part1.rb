# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day12
      # https://adventofcode.com/2024/day/12
      class Part1 < AdventOfCode::Part
        def result
          @regions = []
          find_regions
          @regions.sum(&:value)
        end

        private

        def find_regions
          checked = Set.new

          input_array.each_with_index do |row, r_idx|
            row.size.times do |c_idx|
              coords = [r_idx, c_idx]
              next if checked.include? coords

              region = find_region(coords)
              checked += region.coords
              @regions << region
            end
          end
        end

        def find_region(coords)
          region = new_region(coords)
          build_region region, coords
          region
        end

        def new_region(coords)
          Region.new val coords
        end

        def build_region(region, coords)
          return if region.coords.include?(coords) || val(coords) != region.tag

          region.coords << coords
          adjacent_coords(coords).each { |c| build_region region, c }
        end

        def adjacent_coords(coords)
          [
            [coords[0] + 1, coords[1]],
            [coords[0] - 1, coords[1]],
            [coords[0], coords[1] + 1],
            [coords[0], coords[1] - 1],
          ]
        end

        def val(coords)
          return nil if coords[0].negative? || coords[1].negative?

          input_array.dig(*coords)
        end

        # Save each region as an object
        class Region
          attr_reader :tag
          attr_accessor :coords

          def initialize(tag)
            @tag = tag
            @coords = Set.new
          end

          def value
            area * perimeter
          end

          private

          def area
            @coords.size
          end

          def perimeter
            p = 0
            coords.each do |c|
              adjacent_coords(c).each do |ac|
                next if coords.include? ac

                p += 1
              end
            end

            p
          end

          def adjacent_coords(coords)
            [
              [coords[0] + 1, coords[1]],
              [coords[0] - 1, coords[1]],
              [coords[0], coords[1] + 1],
              [coords[0], coords[1] - 1],
            ]
          end
        end
      end
    end
  end
end
