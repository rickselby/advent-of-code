# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day06
      # https://adventofcode.com/2015/day/6
      class Part2 < Part1
        def result
          lines.each { parse it }
          @map.sum { it.compact.sum }
        end

        private

        def parse(line)
          range = range line
          if line.start_with?("turn on")
            change range, :+, 1
          elsif line.start_with?("turn off")
            change range, :-, 1
          elsif line.start_with?("toggle")
            change range, :+, 2
          else
            raise "what"
          end
        end

        def change(range, operator, value)
          for_range(range) do |x, y|
            @map[x][y] = 0 if @map[x][y].nil?
            @map[x][y] = @map[x][y].public_send(operator, value)
            @map[x][y] = 0 if @map[x][y].negative?
          end
        end
      end
    end
  end
end
