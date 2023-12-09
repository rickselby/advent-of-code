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

          if m[:range].cover?(range.begin) || m[:range].cover?(range.last(1).first)
            return new_ranges m[:diff], map, *split_ranges(m, range)
          end
        end
        range
      end

      def change_range(range, diff)
        (range.begin + diff)...(range.end + diff)
      end

      def split_ranges(map_detail, range)
        if map_detail[:range].cover? range.begin
          [range.begin...map_detail[:range].end, map_detail[:range].end...range.end]
        else
          [map_detail[:range].begin...range.end, range.begin...map_detail[:range].begin]
        end
      end

      def new_ranges(diff, map, range_to_translate, other_range)
        [change_range(range_to_translate, diff), translate_range(map, other_range)].flatten
      end
    end
  end
end
