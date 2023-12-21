# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day20
      # https://adventofcode.com/2023/day/20
      class Part2 < AdventOfCode::Day
        def result
          modules = Modules.new(lines)
          inputs = modules.get(:vd).inputs
          inputs.map { |i| modules.press_button_until_target_outputs_high i }
                .reduce(1, :lcm)
        end
      end
    end
  end
end
