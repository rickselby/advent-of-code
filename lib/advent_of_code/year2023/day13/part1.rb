# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day13
      # https://adventofcode.com/2023/day/13
      class Part1 < AdventOfCode::Day
        def result
          split_maps.sum { |m| Map.new(m).value }
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
      end
    end
  end
end
