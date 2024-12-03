# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day01
      # https://adventofcode.com/2024/day/1
      class Part2 < Part1
        def result
          similarity.sum
        end

        private

        def similarity
          first_line.map { |v| (v * second_line.count(v)) }
        end
      end
    end
  end
end
