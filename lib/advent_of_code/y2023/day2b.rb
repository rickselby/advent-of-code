# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/2
    class Day2b < Day2a
      def result
        @input.lines.map { |l| Line.new l }.sum(&:power)
      end

      # A single line of the input, broken down
      class Line < Day2a::Line
        attr_reader :game_id

        def power
          @colours.values.inject :*
        end
      end
    end
  end
end
