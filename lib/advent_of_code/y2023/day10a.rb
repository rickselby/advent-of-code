# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/10
    class Day10a
      def initialize(input)
        @input = input
      end

      def result
        @map = {}
        @start = []
        parse_map
        path_length / 2
      end

      private

      def parse_map
        @input.lines.each_with_index do |line, row|
          line.chars.each_with_index do |char, col|
            @map[row] ||= {}
            @map[row][col] = char
            @start = [row, col] if char == "S"
          end
        end
      end

      def path_length
        coords, direction = first_coords
        count = 1
        loop do
          coords, direction = next_move coords, direction
          count += 1
          break if @map.dig(*coords) == "S"
        end
        count
      end

      # Find a pipe that connects to the starting position
      def first_coords
        row, col = @start
        return [[row - 1, col], :north] if %w[| 7 F].include? @map[row - 1][col]
        return [[row, col - 1], :east] if %w[- L F].include? @map[row][col - 1]
        return [[row + 1, col], :south] if %w[| L J].include? @map[row + 1][col]

        [[row, col + 1], :west]
      end

      def next_move(coords, direction_entered)
        next_entered_direction = next_direction coords, direction_entered
        [next_coords(coords, next_entered_direction), next_entered_direction]
      end

      def next_direction(coords, direction)
        case @map.dig(*coords)
        when "|", "-" then direction
        when "L" then direction == :south ? :east : :north
        when "J" then direction == :south ? :west : :north
        when "7" then direction == :north ? :west : :south
        when "F" then direction == :north ? :east : :south
        end
      end

      def next_coords(coords, direction)
        row, col = coords
        case direction
        when :north then [row - 1, col]
        when :east then [row, col + 1]
        when :south then [row + 1, col]
        when :west then [row, col - 1]
        end
      end
    end
  end
end
