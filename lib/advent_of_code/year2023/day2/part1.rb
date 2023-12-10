# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day2
      # https://adventofcode.com/2023/day/2
      class Part1 < AdventOfCode::Day
        def result
          @input.lines.map { |l| Line.new l }.select(&:valid?).sum(&:game_id)
        end
      end
    end
  end
end
