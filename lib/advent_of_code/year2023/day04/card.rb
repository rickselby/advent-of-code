# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day04
      # Each line represents a scratch card
      class Card
        attr_reader :number

        def initialize(line)
          matches = line.match(/Card\s+(?<number>\d+):/)
          @number = matches[:number].to_i
          parse_card line.delete_prefix matches[0]
        end

        # 1 point for 1 match; 2 for 2, 4 for 3, 8 for 4, etc.
        def points
          matches.zero? ? 0 : 2**(matches - 1)
        end

        def matches
          winning_numbers.size
        end

        def winner?
          !winning_numbers.empty?
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
