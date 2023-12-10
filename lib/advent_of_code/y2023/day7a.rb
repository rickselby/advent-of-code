# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/7
    class Day7a
      HANDS = {
        five_of_a_kind: 7,
        four_of_a_kind: 6,
        full_house: 5,
        three_of_a_kind: 4,
        two_pair: 3,
        one_pair: 2,
        high_card: 1
      }.freeze

      def initialize(input)
        @input = input
      end

      def result
        parse_hands @input
        total = 0
        @hands.sort { |a, b| sort_hands a[:hand], b[:hand] }
              .each_with_index { |hand, rank| total += (rank + 1) * hand[:bid] }
        total
      end

      def hand_type(hand) # rubocop:disable Metrics/CyclomaticComplexity
        cards = count_cards hand

        case cards.count
        when 1 then HANDS[:five_of_a_kind]
        # could be 4 of a kind, or full house
        when 2 then cards.values.max == 4 ? HANDS[:four_of_a_kind] : HANDS[:full_house]
        # could be 3 of a kind or two pair
        when 3 then cards.values.max == 3 ? HANDS[:three_of_a_kind] : HANDS[:two_pair]
        when 4 then HANDS[:one_pair]
        when 5 then HANDS[:high_card]
        end
      end

      private

      def parse_hands(input)
        @hands = input.lines.map do |line|
          parts = line.split
          { hand: parts[0], bid: parts[1].to_i }
        end
      end

      def count_cards(hand)
        hand.chars.group_by { |char| char }.transform_values(&:count)
      end

      def sort_hands(hand1, hand2)
        return hand_type(hand1) <=> hand_type(hand2) unless hand_type(hand1) == hand_type(hand2)

        5.times do |card|
          unless card_value(hand1[card]) == card_value(hand2[card])
            return card_value(hand1[card]) <=> card_value(hand2[card])
          end
        end

        0
      end

      def card_value(card)
        case card
        when "T" then 10
        when "J" then 11
        when "Q" then 12
        when "K" then 13
        when "A" then 14
        else card.to_i
        end
      end
    end
  end
end
