# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day11
      # https://adventofcode.com/2023/day/11
      class Part1 < AdventOfCode::Day
        def initialize(input, factor = 2)
          super(input)
          @factor = factor
        end

        def result
          @empty_rows = []
          @empty_cols = []

          rows = lines.map(&:strip)
          get_empty_rows rows
          get_empty_cols rows

          get_galaxies(rows)
            .then { |galaxies| get_distances galaxies }
            .sum
        end

        private

        def get_empty_rows(rows)
          rows.each_with_index do |row, index|
            @empty_rows << index if row.chars.all?(".")
          end
        end

        def get_empty_cols(rows)
          rows.first.size.times do |col_index|
            @empty_cols << col_index if rows.map { |r| r[col_index] }.all?(".")
          end
        end

        def get_galaxies(rows)
          rows.each_with_index.with_object([]) do |(row, row_index), galaxies|
            (0...row.length).find_all { |i| row[i] == "#" }
                            .each { |col_index| galaxies << [row_index, col_index] }
          end
        end

        def get_distances(galaxies)
          galaxies.each_with_index.with_object([]) do |(coords, index), distances|
            galaxies[index + 1..].each do |next_coords|
              distances << distance(coords, next_coords)
            end
          end
        end

        def distance(coords1, coords2)
          get_distance(coords1[0], coords2[0], @empty_rows) + get_distance(coords1[1], coords2[1], @empty_cols)
        end

        def get_distance(a, b, empties)
          (b - a).abs + ((range_for(a, b).to_a & empties).size * (@factor - 1))
        end

        def range_for(a, b)
          b > a ? a...b : b...a
        end
      end
    end
  end
end
