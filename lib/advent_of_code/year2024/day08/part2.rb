# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day08
      # https://adventofcode.com/2024/day/8
      class Part2 < Part1
        private

        def calculate_antinodes(node1, node2)
          a = Vector[*node1]
          b = Vector[*node2]
          add_antinode a
          add_antinode b

          diff = a - b

          add_antinodes a, diff, :+
          add_antinodes b, diff, :-
        end

        def add_antinodes(node, diff, operator)
          loop do
            node = node.public_send operator, diff

            break unless in_map? node

            add_antinode node
          end
        end
      end
    end
  end
end
