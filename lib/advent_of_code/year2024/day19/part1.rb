# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day19
      # https://adventofcode.com/2024/day/19
      class Part1 < AdventOfCode::Part
        def result
          find_matches
        end

        private

        def find_matches
          matches = 0
          patterns.each do |pattern|
            @matched = false
            match_pattern(pattern)
            matches += 1 if @matched
          end
          matches
        end

        def match_pattern(pattern)
          return if @matched

          @matched = true if pattern == ""
          return unless grouped_towels.key?(pattern[0])

          grouped_towels[pattern[0]].each do |poss|
            match_pattern pattern.delete_prefix(poss) if pattern.start_with? poss
          end
        end

        def towels
          @towels ||= lines.first.split(",").map(&:strip)
        end

        def patterns
          @patterns ||= lines[2..].to_set(&:strip)
        end

        def grouped_towels
          @grouped_towels ||= towels.group_by { |t| t[0] }
        end
      end
    end
  end
end
