# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/5
    class Day5a
      def initialize(input)
        @input = input
        @seeds = []
        @maps = Hash.new { Hash.new { |_, key| key } }
        read_file
      end

      MAPS = %w[seed-to-soil soil-to-fertilizer fertilizer-to-water water-to-light light-to-temperature temperature-to-humidity humidity-to-location].freeze

      def result
        values = @seeds.map(&:to_i)
        MAPS.each do |map|
          values = values.map { |v| @maps[map][v] }
        end
        values.min
      end

      private

      def read_file
        map = nil
        @input.lines.each_with_index do |line, index|
          if index.zero?
            read_first_line line
            next
          end

          line.strip!

          next if line.empty?

          if line.end_with? "map:"
            map = line.split[0]
            p map
            next
          end

          update_map map, line
        end
      end

      def read_first_line(line)
        @seeds = line.split(":")[1].strip.split
      end

      def update_map(map_name, line)
        map = @maps[map_name]
        values = line.split.map(&:to_i)
        (0...values[2]).each do |v|
          map[values[1] + v] = values[0] + v
        end

        @maps[map_name] = map
      end
    end
  end
end
