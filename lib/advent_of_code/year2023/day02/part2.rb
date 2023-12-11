# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day02
      # https://adventofcode.com/2023/day/2
      class Part2 < Part1
        def result
          lines.map { |l| Line.new l }.sum(&:power)
        end
      end
    end
  end
end
