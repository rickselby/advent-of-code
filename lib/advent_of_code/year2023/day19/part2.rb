# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day19
      # https://adventofcode.com/2023/day/19
      class Part2 < Part1
        def result
          @ruleset = {}
          @parts = []
          parse_input
          count_possibilities get_valid_ranges({ x: 1..4000, m: 1..4000, a: 1..4000, s: 1..4000 })
        end

        private

        def get_valid_ranges(part, ruleset = :in) # rubocop:disable Metrics/AbcSize
          @ruleset[ruleset].filter_map do |rule|
            next handle_continue part, rule[:continue] if rule[:type] == :continue
            next unless part[rule[:key]].include? rule[:value]

            branch_range, continue_range = split_range part[rule[:key]], rule[:value], rule[:comparison]

            part[rule[:key]] = continue_range
            handle_continue new_part(part, rule[:key], branch_range), rule[:continue]
          end.flatten
        end

        def handle_continue(part, continue)
          if %i[A R].include? continue
            continue == :A ? part : nil
          else
            get_valid_ranges part, continue
          end
        end

        def split_range(range, value, comparison)
          if comparison == :>
            [(value + 1)..range.end, range.begin..value]
          else
            [(range.begin..value - 1), (value..range.end)]
          end
        end

        def count_possibilities(parts)
          parts.sum { |p| p.values.map(&:size).reduce(:*) }
        end

        def new_part(part, key, range)
          part.dup.merge({ key => range })
        end
      end
    end
  end
end
