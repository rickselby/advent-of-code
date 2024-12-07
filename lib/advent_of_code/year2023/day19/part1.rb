# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day19
      # https://adventofcode.com/2023/day/19
      class Part1 < AdventOfCode::Part
        def result
          @ruleset = {}
          @parts = []
          parse_input
          sum_accepted_parts(@parts.select { |p| accept_part? p })
        end

        private

        def parse_input
          input_lines = lines.map(&:strip)
          loop do
            line = input_lines.shift
            break if line.empty?

            add_ruleset line
          end

          input_lines.each do |line|
            add_part line
          end
        end

        def add_ruleset(line)
          matches = line.match(/(.+){(.*)}/)
          name, rules = matches[1..2]
          @ruleset[name.to_sym] = rules.split(",").map { |r| parse_rule r }
        end

        def add_part(line)
          part = {}
          line[1..-2].split(",").each do |val_string|
            key, val = val_string.split "="
            part[key.to_sym] = val.to_i
          end
          @parts << part
        end

        def accept_part?(part, ruleset = :in)
          @ruleset[ruleset].each do |rule|
            return handle_continue part, rule[:continue] if rule_matches?(rule, part)
          end
        end

        def parse_rule(rule)
          if rule.count("<>").positive?
            comparision_rule rule
          else
            { type: :continue, continue: rule.to_sym }
          end
        end

        def comparision_rule(rule)
          matches = rule.match(/(.)(.)(\d+):(.*)/)
          {
            type:       :comparison,
            key:        matches[1].to_sym,
            comparison: matches[2].to_sym,
            value:      matches[3].to_i,
            continue:   matches[4].to_sym,
          }
        end

        def handle_continue(part, continue)
          if %i[A R].include? continue
            continue == :A
          else
            accept_part? part, continue
          end
        end

        def rule_matches?(rule, part)
          return true if rule[:type] == :continue

          part[rule[:key]].public_send(rule[:comparison], rule[:value])
        end

        def sum_accepted_parts(parts)
          parts.sum { |p| p.values.sum }
        end
      end
    end
  end
end
