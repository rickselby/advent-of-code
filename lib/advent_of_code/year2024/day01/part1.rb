# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day01
      # https://adventofcode.com/2024/day/1
      class Part1 < AdventOfCode::Day
        def result
          distances.sum
        end

        private

        def distances
          first_line.map.with_index { |v, i| (v - second_line[i]).abs }
        end

        def first_line
          split_lines[0].map(&:to_i).sort
        end

        def second_line
          split_lines[1].map(&:to_i).sort
        end

        def split_lines
          @split_lines ||= lines.map(&:split).transpose
        end
      end
    end
  end
end
