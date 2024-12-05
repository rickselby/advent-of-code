# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day05
      # https://adventofcode.com/2024/day/5
      class Part2 < Part1
        def result
          updates.reject { |u| update_valid? u }
                 .map { |u| fix u }
                 .sum { |u| middle_value u }
        end

        private

        def fix(update)
          until update_valid?(update)
            rules.each do |rule|
              # confirm both numbers are in the rule
              next unless rule & update == rule && update & rule != rule

              # swap them?
              i0 = update.find_index(rule[0])
              i1 = update.find_index(rule[1])

              update[i0], update[i1] = update[i1], update[i0]
            end
          end

          update
        end
      end
    end
  end
end
