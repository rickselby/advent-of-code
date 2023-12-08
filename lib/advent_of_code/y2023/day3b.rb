# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/3
    class Day3b < Day3a
      def result
        @possible_gear_counts = {}
        look_for_gears
        actual_gears.values.sum { |numbers| numbers.inject(:*) }
      end

      private

      def lines
        @lines ||= @input.lines
      end

      def look_for_gears
        lines.each_with_index { |line, row| check_for_data line, row }
      end

      def actual_gears
        @possible_gear_counts.select { |_, numbers| numbers.size == 2 }
      end

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

      def load_possible_gears
        symbols = []
        lines.each_with_index do |line, row|
          index = -1
          loop do
            index = line.index(/\*/, index + 1)
            break if index.nil?

            symbols << [row, index]
          end
        end
        symbols
      end

      def check_for_possible_gears(number_row, col1, col2, number)
        # build a list of coords where we need a symbol
        coords = []
        (number_row - 1..number_row + 1).each do |row|
          (col1 - 1..col2 + 1).each do |col|
            coords << [row, col]
          end
        end

        possible_gears.intersection(coords).each { |coordinates| add_number coordinates, number }
      end

      def add_number(coordinates, number)
        key = coordinates.join ":"

        @possible_gear_counts[key] = [] unless @possible_gear_counts.key? key
        @possible_gear_counts[key] << number
      end
    end
  end
end
