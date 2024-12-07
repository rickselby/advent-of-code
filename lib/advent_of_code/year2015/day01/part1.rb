# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day01
      # https://adventofcode.com/2015/day/1
      class Part1 < AdventOfCode::Part
        def result
          single_line.count("(") - single_line.count(")")
        end
      end
    end
  end
end
