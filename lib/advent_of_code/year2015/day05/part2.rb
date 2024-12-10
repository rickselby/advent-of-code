# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day05
      # https://adventofcode.com/2015/day/5
      class Part2 < Part1
        def nice?(string)
          return false unless string.match?(/(..).*\1/)

          string.match?(/(.).\1/)
        end
      end
    end
  end
end
