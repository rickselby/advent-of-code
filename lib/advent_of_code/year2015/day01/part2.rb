# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day01
      # https://adventofcode.com/2015/day/1
      class Part2 < AdventOfCode::Part
        def result
          floor = 0
          single_line.chars.each_with_index do |char, i|
            case char
            when "(" then floor += 1
            when ")" then floor -= 1
            end

            return i + 1 if floor == -1
          end
        end
      end
    end
  end
end
