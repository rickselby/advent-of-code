# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/10
    class Day10b < Day10a
      def result
        @map = {}
        @start = []
        parse_map
        clear_non_loop_tiles loop_tiles
        replace_start
        check_non_loop_tiles
      end

      private

      # Get a list of coordinates that are part of the loop
      def loop_tiles
        all_coords = []
        coords, direction = first_coords
        all_coords << coords
        loop do
          coords, direction = next_move coords, direction
          all_coords << coords
          break if @map.dig(*coords) == "S"
        end
        all_coords
      end

      # Set all coordinates not in `loop_tiles` to nil
      def clear_non_loop_tiles(loop_tiles)
        @map.each do |row, cells|
          cells.each_key do |col|
            @map[row][col] = nil unless loop_tiles.include? [row, col]
          end
        end
      end

      # Replace the 'S' with the correct symbol
      def replace_start
        row, col = @start
        @map[row][col] = start_symbol
      end

      def start_symbol
        directions = start_directions

        if directions.include? :north
          { east: "L", south: "|", west: "J" }[(directions - [:north]).first]
        elsif directions.include? :east
          { south: "F", east: "-" }[(directions - [:east]).first]
        else
          "7"
        end
      end

      def check_non_loop_tiles
        count = 0
        @map.each do |row, cells|
          cells.each do |col, val|
            next unless val.nil?

            symbols_to_the_left = @map[row].values[...col].compact.reject { |v| v == "-" }
            next if symbols_to_the_left.empty?

            count += 1 if inside? symbols_to_the_left
          end
        end
        count
      end

      def inside?(symbols) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
        inside = false
        turn = nil
        symbols.each do |symbol|
          case symbol
          when "|" then inside = !inside
          when "F", "L" then turn = symbol
          when "7" then inside = !inside if turn == "L"
          when "J" then inside = !inside if turn == "F"
          end
        end
        inside
      end
    end
  end
end
