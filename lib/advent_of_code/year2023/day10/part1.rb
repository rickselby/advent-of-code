# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day10
      # https://adventofcode.com/2023/day/10
      class Part1 < AdventOfCode::Part
        def result
          parse_map
          path_length / 2
        end

        private

        def parse_map
          @map = {}
          lines.each_with_index do |line, row|
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
          directions = start_directions
          return [[row - 1, col], :north] if directions.include? :north
          return [[row, col - 1], :west] if directions.include? :west

          # If neither north nor west are included, it must be "7" (south east)
          [[row + 1, col], :south]
        end

        def start_directions
          row, col = @start
          directions = []
          directions << :north if %w[| 7 F].include? @map.dig(row - 1, col)
          directions << :east if %w[- J 7].include? @map.dig(row, col + 1)
          directions << :south if %w[| L J].include? @map.dig(row + 1, col)
          directions << :west if %w[- L F].include? @map.dig(row, col - 1)
          directions
        end

        def next_move(coords, direction_entered)
          next_entered_direction = next_direction coords, direction_entered
          [next_coords(coords, next_entered_direction), next_entered_direction]
        end

        def next_direction(coords, direction) # rubocop:disable Metrics/CyclomaticComplexity
          case @map.dig(*coords)
          when "|", "-" then direction
          when "L" then (direction == :south) ? :east : :north
          when "J" then (direction == :south) ? :west : :north
          when "7" then (direction == :north) ? :west : :south
          when "F" then (direction == :north) ? :east : :south
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
end
