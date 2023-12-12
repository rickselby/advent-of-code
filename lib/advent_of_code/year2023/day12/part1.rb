# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day12
      # https://adventofcode.com/2023/day/12
      class Part1 < AdventOfCode::Day
        def result
          lines.sum { |l| Line.new(l).possibilities }
        end
      end
    end
  end
end
