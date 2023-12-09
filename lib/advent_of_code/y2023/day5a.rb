# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/5
    class Day5a
      def initialize(input)
        @input = input
        @seeds = []
        @maps = {}
        read_file
      end

      MAPS = %i[seed-to-soil soil-to-fertilizer fertilizer-to-water water-to-light light-to-temperature
                temperature-to-humidity humidity-to-location].freeze

      def result
        values = @seeds.map(&:to_i)
        MAPS.each do |map|
          values = values.map { |v| translate_value map, v }
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
            map = line.split[0].to_sym
            next
          end

          update_map map, line
        end
      end

      def read_first_line(line)
        @seeds = line.split(":")[1].strip.split
      end

      def update_map(map, line)
        values = line.split.map(&:to_i)
        @maps[map] ||= []
        @maps[map].append({
          range: values[1]...(values[1] + values[2]),
          diff: values[0] - values[1]
        })
      end

      def translate_value(map, value)
        @maps[map].each do |m|
          next unless m[:range].include? value

          return value + m[:diff]
        end
        value
      end
    end
  end
end
