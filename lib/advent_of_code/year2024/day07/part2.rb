# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day07
      # https://adventofcode.com/2024/day/7
      class Part2 < Part1
        private

        def functions
          @functions ||= [
            ->(a, b) { a + b },
            ->(a, b) { a * b },
            ->(a, b) { [a.to_s, b.to_s].join.to_i },
          ]
        end
      end
    end
  end
end
