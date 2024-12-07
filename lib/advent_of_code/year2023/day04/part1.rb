# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day04
      # https://adventofcode.com/2023/day/4
      class Part1 < AdventOfCode::Part
        def result
          lines.map { |l| Card.new l }.sum(&:points)
        end
      end
    end
  end
end
