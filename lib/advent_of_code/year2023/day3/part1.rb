# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day3
      # https://adventofcode.com/2023/day/3
      class Part1 < AdventOfCode::Day
        def result
          numbers.sum
        end

        private

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

        # Coordinates of all symbols
        def symbols
          @symbols ||= load_symbols
        end

        # Build an array of coordinates of all symbols
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

        # Check there is a symbol in the coordinates around the number
        def valid?(number_row, col1, col2)
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
end
