# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day07
      # https://adventofcode.com/2025/day/7
      class Part1 < AdventOfCode::Part
        def result
          @splits = 0
          tachyons = [find_start(lines.shift)]
          lines.each do |line|
            tachyons = process_line line, tachyons
          end
          @splits
        end

        private

        def find_start(line)
          line.chars.find_index "S"
        end

        def process_line(line, tachyons)
          new_tachyons = []
          tachyons.each do |t|
            if line[t] == "^"
              @splits += 1
              new_tachyons << (t + 1)
              new_tachyons << (t - 1)
            else
              new_tachyons << t
            end
          end

          new_tachyons.uniq.sort
        end
      end
    end
  end
end
