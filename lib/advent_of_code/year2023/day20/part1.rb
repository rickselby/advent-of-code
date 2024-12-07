# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day20
      # https://adventofcode.com/2023/day/20
      class Part1 < AdventOfCode::Part
        def result
          modules = Modules.new(lines)
          1000.times do
            modules.press_button
          end
          modules.result
        end
      end
    end
  end
end
