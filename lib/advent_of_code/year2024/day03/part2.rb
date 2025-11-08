# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day03
      # https://adventofcode.com/2024/day/3
      class Part2 < Part1
        DO_DONT_REGEX = /(don't\(\).*?do\(\))/
        DONT_AT_END = /(don't\(\).*\z)/

        private

        def muls
          tidy_line.scan REGEX
        end

        def tidy_line
          line = single_line
          single_line.scan(DO_DONT_REGEX).each { line.gsub!(it[0], "") }
          line.scan(DONT_AT_END).each { line.gsub!(it[0], "") }
          line
        end
      end
    end
  end
end
