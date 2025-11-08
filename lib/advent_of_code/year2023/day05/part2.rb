# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day05
      # https://adventofcode.com/2023/day/5
      class Part2 < Part1
        def result
          ranges = seed_ranges
          # Translate each range (splitting ranges where appropriate)
          MAPS.each do |map|
            ranges = ranges.flat_map { translate_range map, it }
          end
          ranges.map(&:begin).min
        end

        private

        # Build ranges from the seed data
        def seed_ranges
          @seeds.map(&:to_i).each_slice(2).flat_map do |range|
            (range[0]...(range[0] + range[1]))
          end
        end

        def translate_range(map, range)
          @maps[map].each do |m|
            # If the range is fully covered, translate the whole thing
            return change_range(range, m[:diff]) if m[:range].cover? range

            # If it is partially covered, split it, translate the covered part, and check the other part
            if m[:range].cover?(range.begin) || m[:range].cover?(range.last(1).first)
              return new_ranges m[:diff], map, *split_ranges(m, range)
            end
          end
          range
        end

        # Change a range by the given difference
        def change_range(range, diff)
          (range.begin + diff)...(range.end + diff)
        end

        # Given two ranges that overlap, return
        # - the part of `range` that overlaps with `source_range` (and should be changed)
        # - the part of `range` that does not overlap `source_range` (and should be checked)
        def split_ranges(map_detail, range)
          if map_detail[:range].cover? range.begin
            [range.begin...map_detail[:range].end, map_detail[:range].end...range.end]
          else
            [map_detail[:range].begin...range.end, range.begin...map_detail[:range].begin]
          end
        end

        def new_ranges(diff, map, range_to_change, other_range)
          [change_range(range_to_change, diff), translate_range(map, other_range)].flatten
        end
      end
    end
  end
end
