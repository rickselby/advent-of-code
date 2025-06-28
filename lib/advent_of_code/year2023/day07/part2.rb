# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day07
      # https://adventofcode.com/2023/day/7
      class Part2 < Part1
        private

        def count_cards(hand)
          cards = super
          return cards unless cards.key?("J")
          return cards if cards.one?

          move_jacks cards
        end

        def move_jacks(cards)
          jacks = cards.delete "J"
          max_key = cards.max_by { |_, v| v }[0]
          cards[max_key] += jacks
          cards
        end

        def card_value(card)
          case card
          when "T" then 10
          when "J" then 1
          when "Q" then 12
          when "K" then 13
          when "A" then 14
          else card.to_i
          end
        end
      end
    end
  end
end
