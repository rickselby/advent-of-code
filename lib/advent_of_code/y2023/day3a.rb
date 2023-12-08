# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/3
    class Day3a
      def initialize(input)
        @input = input
      end

      def result
        numbers.sum
      end

      private

      def lines
        @lines ||= @input.lines
      end

      def numbers
        numbers = []
        lines.each_with_index do |line, row|
          numbers += check_for_data line, row
        end
        numbers
      end

      def check_for_data(line, row, index = -1, numbers = [])
        match_data = line.match(/\d+/, index + 1)
        return numbers if match_data.nil?

        start, finish = match_data.offset(0)
        finish -= 1

        numbers << match_data[0].to_i if valid? row, start, finish

        check_for_data line, row, finish, numbers
      end

      def symbols
        @symbols ||= load_symbols
      end

      def load_symbols
        symbols = []
        lines.each_with_index do |line, row|
          index = -1
          loop do
            index = line.index(/[^\d.\s]/, index + 1)
            break if index.nil?

            symbols << [row, index]
          end
        end
        symbols
      end

      def valid?(number_row, col1, col2)
        # build a list of coords where we need a symbol
        coords = []
        (number_row - 1..number_row + 1).each do |row|
          (col1 - 1..col2 + 1).each do |col|
            coords << [row, col]
          end
        end
        !symbols.intersection(coords).empty?
      end
    end
  end
end
