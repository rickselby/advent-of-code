# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day13
      # https://adventofcode.com/2024/day/13
      class Part2 < Part1
        private

        def build_machine(m_lines)
          h = super
          h[:tx] += 10_000_000_000_000
          h[:ty] += 10_000_000_000_000
          h
        end
      end
    end
  end
end
