# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day15
      # https://adventofcode.com/2023/day/15
      class Part1 < AdventOfCode::Day
        def result
          steps.sum { |s| hash s }
        end

        def hash(string)
          string.chars.reduce(0) { |sum, c| value c, sum }
        end

        private

        def steps
          @input.strip.split(",")
        end

        def value(character, sum)
          sum += character.ord
          sum *= 17
          sum % 256
        end
      end
    end
  end
end
