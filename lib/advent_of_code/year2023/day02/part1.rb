# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day02
      # https://adventofcode.com/2023/day/2
      class Part1 < AdventOfCode::Part
        def result
          lines.map { |l| Line.new l }.select(&:valid?).sum(&:game_id)
        end
      end
    end
  end
end
