# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day05
      # https://adventofcode.com/2024/day/5
      class Part1 < AdventOfCode::Day
        def result
          updates.select { |u| update_valid? u }.sum { |u| middle_value u }
        end

        private

        def middle_value(arr)
          arr[((arr.length - 1) / 2)]
        end

        def update_valid?(update)
          rules.each do |rule|
            # confirm both numbers are in the rule
            next unless rule & update == rule

            # fail if they are not in the correct order
            return false if update & rule != rule
          end

          true
        end

        def rules
          @rules = get_lines separator: "|"
        end

        def updates
          @updates = get_lines separator: ","
        end

        def get_lines(separator:)
          lines.partition { |l| l.include? separator }
               .first
               .map { |v| v.split(separator).map(&:to_i) }
        end
      end
    end
  end
end
