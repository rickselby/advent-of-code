# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day13
      # https://adventofcode.com/2023/day/13
      class Part2 < Part1
        def result
          split_maps.sum { |m| Map.new(m).smudged_value }
        end
      end
    end
  end
end
