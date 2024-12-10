# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day06
      # https://adventofcode.com/2015/day/6
      class Part1 < AdventOfCode::Part
        def initialize(input)
          super
          @map = []
          1000.times { @map << [] }
        end

        def result
          lines.each { |l| parse l }
          @map.sum { |l| l.count { |c| c } }
        end

        private

        def parse(line)
          range = range line
          if line.start_with?("turn on")
            set range, true
          elsif line.start_with?("turn off")
            set range, false
          elsif line.start_with?("toggle")
            toggle range
          else
            raise "what"
          end
        end

        def range(line)
          line.match(/(\d+),(\d+) through (\d+),(\d+)/)
        end

        def set(range, value)
          for_range(range) { |x, y| @map[x][y] = value }
        end

        def toggle(range)
          for_range(range) { |x, y| @map[x][y] = !@map[x][y] }
        end

        def for_range(range)
          coords = range.captures.map(&:to_i)
          (coords[0]..coords[2]).each do |x|
            (coords[1]..coords[3]).each do |y|
              yield x, y
            end
          end
        end
      end
    end
  end
end
