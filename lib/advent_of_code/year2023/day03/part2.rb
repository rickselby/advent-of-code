# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day03
      # https://adventofcode.com/2023/day/3
      class Part2 < Part1
        def result
          # A list of asterisk coordinates and any numbers that are adjacent
          @possible_gear_counts = {}
          look_for_gears
          actual_gears.values.sum { it.reduce(:*) }
        end

        private

        def look_for_gears
          lines.each_with_index { |line, row| check_for_data line, row }
        end

        def actual_gears
          @possible_gear_counts.select { |_, numbers| numbers.size == 2 }
        end

        # Find numbers and see if they are near asterisks
        def check_for_data(line, row, index = -1)
          match_data = line.match(/\d+/, index + 1)
          return if match_data.nil?

          start, finish = match_data.offset(0)
          finish -= 1

          check_for_possible_gears row, start, finish, match_data[0].to_i
          check_for_data line, row, finish
        end

        def possible_gears
          @possible_gears ||= load_possible_gears
        end

        # Get a list of coordinates of all asterisks in the grid
        def load_possible_gears
          lines.each_with_index.with_object([]) do |(line, row), symbols|
            index = -1
            loop do
              index = line.index(/\*/, index + 1)
              break if index.nil?

              symbols << [row, index]
            end
          end
        end

        # Check if there is an asterisk next to this number
        def check_for_possible_gears(number_row, col1, col2, number)
          coords = []
          ((number_row - 1)..(number_row + 1)).each do |row|
            ((col1 - 1)..(col2 + 1)).each do |col|
              coords << [row, col]
            end
          end

          possible_gears.intersection(coords).each { add_number it, number }
        end

        # Mark that a number is adjacent to an asterisk
        def add_number(coordinates, number)
          key = coordinates.join ":"

          @possible_gear_counts[key] = [] unless @possible_gear_counts.key? key
          @possible_gear_counts[key] << number
        end
      end
    end
  end
end
