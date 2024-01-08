# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day12
      # https://adventofcode.com/2023/day/12
      class Part2 < Part1
        def result
          lines.sum { |l| Line.new(unfold(l)).possibilities }
        end

        private

        def unfold(line)
          springs, groups = line.split
          new_springs = Array.new(5) { springs }.join("?")
          new_groups = Array.new(5) { groups }.join(",")
          "#{new_springs} #{new_groups}"
        end
      end
    end
  end
end
