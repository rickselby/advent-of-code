# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day03
      # https://adventofcode.com/2024/day/3
      class Part1 < AdventOfCode::Part
        REGEX = /mul\((\d+),(\d+)\)/

        def result
          muls.sum { it.map(&:to_i).reduce(:*) }
        end

        private

        def muls
          single_line.scan REGEX
        end
      end
    end
  end
end
