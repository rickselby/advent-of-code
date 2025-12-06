# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day06
      # https://adventofcode.com/2025/day/6
      class Part1 < AdventOfCode::Part
        def result
          @cols = []
          parse_input
          do_sums
        end

        private

        def parse_input
          lines.each do |line|
            line.split.each_with_index do |v, i|
              @cols[i] ||= []
              @cols[i] << v
            end
          end
        end

        def do_sums
          @cols.sum do |col|
            type = col.pop.to_sym
            col.map(&:to_i).reduce(type)
          end
        end
      end
    end
  end
end
