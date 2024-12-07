# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day02
      # https://adventofcode.com/2015/day/2
      class Part2 < Part1
        private

        def calc(line)
          dimensions = line.split("x").map(&:to_i)
          dimensions.min(2).sum { |d| d * 2 } + dimensions.reduce(:*)
        end
      end
    end
  end
end
