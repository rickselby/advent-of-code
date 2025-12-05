# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day04
      # https://adventofcode.com/2025/day/4
      class Part2 < Part1
        def result
          @map = AdventOfCode::Helpers::Map.new(input_array)
          count = 0
          loop do
            removed = remove_rolls
            break if removed.zero?

            count += removed
          end
          count
        end

        private

        def remove_rolls
          coords = @map.all_coords.select { accessible? it }
          coords.each { @map.set it, "." }
          coords.size
        end
      end
    end
  end
end
