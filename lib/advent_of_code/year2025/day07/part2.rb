# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day07
      # https://adventofcode.com/2025/day/7
      class Part2 < Part1
        def result
          tachyons = { find_start(lines.shift) => 1 }
          lines.each do |line|
            tachyons = process_line line, tachyons
          end
          tachyons.values.sum
        end

        private

        def process_line(line, tachyons)
          new_tachyons = Hash.new(0)
          tachyons.flat_map do |t, count|
            if line[t] == "^"
              new_tachyons[t + 1] += count
              new_tachyons[t - 1] += count
            else
              new_tachyons[t] += count
            end
          end
          new_tachyons
        end
      end
    end
  end
end
