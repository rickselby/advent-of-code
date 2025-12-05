# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day05
      # https://adventofcode.com/2025/day/5
      class Part1 < AdventOfCode::Part
        def result
          @ranges = []
          @ingredients = []
          parse_input

          @ingredients.count { |i| @ranges.any? { |r| r.include? i } }
        end

        def parse_input
          input_lines = lines.map(&:strip)
          loop do
            line = input_lines.shift
            break if line.empty?

            add_range line
          end

          input_lines.each do |line|
            add_ingredient line
          end
        end

        def add_range(line)
          from, to = line.split "-"
          @ranges << ((from.to_i)..(to.to_i))
        end

        def add_ingredient(line)
          @ingredients << line.to_i
        end
      end
    end
  end
end
