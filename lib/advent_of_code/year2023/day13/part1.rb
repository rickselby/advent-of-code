# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day13
      # https://adventofcode.com/2023/day/13
      class Part1 < AdventOfCode::Day
        def result
          split_maps.sum { |m| map_value(m) }
        end

        def map_value(map)
          rows = check_map map
          return rows * 100 unless rows.nil?

          map = transpose map
          check_map map
        end

        private

        def split_maps
          maps = []
          map = []
          lines.each do |line|
            line.strip!
            next map.push line unless line.empty?

            maps.push map
            map = []
          end
          maps.push map
        end

        def check_map(map)
          map.each_with_index do |_, index|
            return index + 1 if check_mirror map, index
          end

          nil
        end

        def check_mirror(map, left, right = left + 1, first: true)
          return !first if left.negative? || right >= map.size

          map[left] == map[right] ? check_mirror(map, left - 1, right + 1, first: false) : false
        end

        def transpose(map)
          new_map = []
          map.first.size.times do |i|
            new_map[i] = ""
            map.each { |line| new_map[i] += line[i] }
          end
          new_map
        end
      end
    end
  end
end
