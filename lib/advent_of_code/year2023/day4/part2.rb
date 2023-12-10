# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day4
      # https://adventofcode.com/2023/day/4
      class Part2 < Part1
        def initialize(lines)
          super(lines)
          # Keys are card numbers, values are the amount of that card
          @cards = {}
        end

        def result
          init_counts
          count_cards
          @cards.values.sum
        end

        private

        def lines
          @lines ||= @input.lines
        end

        # Set up hash with one of each card
        def init_counts
          (1..lines.size).each { |n| @cards[n] = 1 }
        end

        def count_cards
          lines.map { |l| Card.new l }.each do |card|
            next unless card.winner?

            # if card 10 were to have 5 matching numbers, you would win one copy each of cards 11, 12, 13, 14, and 15
            # if we have *two* card 10s, then we win *two* copies of 11, 12, 13, 14 and 15.
            # So, add on the count of the current card to the next x cards (x = winning numbers)
            ((card.number + 1)..(card.number + card.matches)).each do |n|
              @cards[n] += @cards[card.number]
            end
          end
        end
      end
    end
  end
end
