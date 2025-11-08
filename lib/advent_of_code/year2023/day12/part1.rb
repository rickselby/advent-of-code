# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day12
      # https://adventofcode.com/2023/day/12
      class Part1 < AdventOfCode::Part
        def result
          lines.sum { Line.new(it).possibilities }
        end
      end
    end
  end
end
