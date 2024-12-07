# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day02
      # https://adventofcode.com/2015/day/2
      class Part1 < AdventOfCode::Part
        def result
          lines.sum { |line| calc line }
        end

        private

        def calc(line)
          l, w, h = line.split("x").map(&:to_i)
          sides = [l * w, w * h, h * l]
          sides.sum { |s| s * 2 } + sides.min
        end
      end
    end
  end
end
