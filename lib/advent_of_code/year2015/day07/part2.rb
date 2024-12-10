# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day07
      # https://adventofcode.com/2015/day/7
      class Part2 < Part1
        def result
          val = super
          @wires = { "b" => val }
          @lines = @input.lines.map(&:strip)
          loop do
            parse @lines.shift
            break if @lines.empty?
          end
          @wires["a"]
        end
      end
    end
  end
end
