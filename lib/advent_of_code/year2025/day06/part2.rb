# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day06
      # https://adventofcode.com/2025/day/6
      class Part2 < Part1
        private

        def parse_input
          idx = 0
          input_array.map(&:reverse).transpose.each do |col|
            next if col.all? { it == " " }

            type = col.pop
            @cols[idx] ||= []
            @cols[idx] << col.join.to_i
            next if type == " "

            @cols[idx] << type.to_sym
            idx += 1
          end
        end

        def input_array
          @input.lines.map { it.chop.chars }
        end
      end
    end
  end
end
