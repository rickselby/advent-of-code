# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day4
      # https://adventofcode.com/2023/day/4
      class Part1 < AdventOfCode::Day
        def result
          lines.map { |l| Card.new l }.sum(&:points)
        end
      end
    end
  end
end
