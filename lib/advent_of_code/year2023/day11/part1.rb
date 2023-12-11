# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day11
      # https://adventofcode.com/2023/day/11
      class Part1 < AdventOfCode::Day
        def result
          add_rows.then { |rows| add_columns rows }
                  .then { |rows| get_galaxies rows }
                  .then { |galaxies| get_distances galaxies }
                  .sum
        end

        private

        def add_rows
          map_lines = []
          lines.map(&:strip).each do |line|
            map_lines << line
            map_lines << line if line.chars.all?(".")
          end
          map_lines
        end

        def add_columns(rows)
          new_rows = {}
          rows.size.times { |i| new_rows[i] = [] }
          rows.first.size.times do |i|
            all_empty = rows.map { |r| r[i] }.all?(".")
            new_rows = add_cols rows, i, new_rows, all_empty
          end
          new_rows.values
        end

        def add_cols(rows, col, new_rows, all_empty)
          rows.each_with_index do |row, row_index|
            new_rows[row_index] << row[col]
            new_rows[row_index] << row[col] if all_empty
          end
          new_rows
        end

        def get_galaxies(rows)
          galaxies = []
          rows.each_with_index do |row, row_index|
            (0...row.length).find_all { |i| row[i] == "#" }
                            .each { |col_index| galaxies << [row_index, col_index] }
          end
          galaxies
        end

        def get_distances(galaxies)
          distances = []
          galaxies.each_with_index do |coords, index|
            galaxies[index + 1..].each do |next_coords|
              distances << ((coords[0] - next_coords[0]).abs + (coords[1] - next_coords[1]).abs)
            end
          end
          distances
        end
      end
    end
  end
end
