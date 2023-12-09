# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/4
    class Day4a
      def initialize(input)
        @input = input
      end

      def result
        @input.lines.map { |l| Card.new l }.sum(&:points)
      end

      # Each line represents a card
      class Card
        def initialize(line)
          matches = line.match(/Card\s+\d+:/)
          parse_card line.delete_prefix matches[0]
        end

        def points
          matches.zero? ? 0 : 2**(matches - 1)
        end

        def matches
          winning_numbers.size
        end

        private

        def parse_card(numbers)
          your_numbers, game_numbers = numbers.split("|")
          @your_numbers = your_numbers.split.map(&:to_i)
          @game_numbers = game_numbers.split.map(&:to_i)
        end

        def winning_numbers
          @your_numbers.intersection @game_numbers
        end
      end
    end
  end
end
