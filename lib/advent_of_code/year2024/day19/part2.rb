# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day19
      # https://adventofcode.com/2024/day/19
      class Part2 < Part1
        private

        def find_matches
          @match_history = {}
          @matches = 0
          patterns.each do |pattern|
            @matched = false
            @matches += match_pattern(pattern)
          end
          @matches
        end

        def match_pattern(pattern)
          return 0 unless grouped_towels.key?(pattern[0])

          @match_history[pattern] ||= grouped_towels[pattern[0]].sum do |poss|
            if poss == pattern
              1
            elsif pattern.start_with? poss
              match_pattern pattern.delete_prefix(poss)
            else
              0
            end
          end
        end
      end
    end
  end
end
