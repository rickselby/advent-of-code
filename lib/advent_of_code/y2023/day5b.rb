# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/5
    class Day5b < Day5a
      def result
        ranges = seed_ranges
        p ranges.sort_by(&:begin)
        MAPS.each do |map|
          ranges = ranges.flat_map { |r| translate_range map, r }
          p ranges.sort_by(&:begin)
        end
        ranges.map(&:begin).min
      end

      private

      def seed_ranges
        @seeds.map(&:to_i).each_slice(2).flat_map do |range|
          (range[0]...(range[0] + range[1]))
        end
      end

      def translate_range(map, range)
        @maps[map].each do |m|
          return change_range(range, m[:diff]) if m[:range].cover? range

          if m[:range].cover? range.begin
            range_to_translate = range.begin...m[:range].end
            other_range = m[:range].end...range.end
            # p "#{range} => #{range_to_translate}, #{other_range}"
            return [change_range(range_to_translate, m[:diff]), translate_range(map, other_range)].flatten
          end

          if m[:range].cover? range.last(1).first
            range_to_translate = m[:range].begin...range.end
            other_range = range.begin...m[:range].begin
            return [change_range(range_to_translate, m[:diff]), translate_range(map, other_range)].flatten
          end
        end
        range
      end

      def change_range(range, diff)
        (range.begin + diff)...(range.end + diff)
      end
    end
  end
end
