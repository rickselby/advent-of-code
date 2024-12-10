# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day05
      # https://adventofcode.com/2015/day/5
      class Part1 < AdventOfCode::Part
        def result
          lines.count { |l| nice? l }
        end

        def nice?(string)
          return false if %w[ab cd pq xy].any? { |s| string.include? s }
          return false unless string.match? /(.)\1/

          string.scan(/[aeiou]/).size >= 3
        end
      end
    end
  end
end
