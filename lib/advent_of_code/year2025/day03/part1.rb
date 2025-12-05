# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day03
      # https://adventofcode.com/2025/day/3
      class Part1 < AdventOfCode::Part
        def result
          input_array.sum { joltage it }
        end

        private

        def joltage(line)
          tens = line[..-2].max
          tens_location = line.find_index tens
          units = line[(tens_location + 1)..].max
          (tens.to_i * 10) + units.to_i
        end
      end
    end
  end
end
