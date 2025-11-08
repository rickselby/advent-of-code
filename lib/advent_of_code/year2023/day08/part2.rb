# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day08
      # https://adventofcode.com/2023/day/8
      class Part2 < Part1
        def result
          starting_nodes.map { count_for_node it, "Z" }
                        .reduce(1, :lcm)
        end

        private

        def starting_nodes
          @nodes.keys.select { it.end_with? "A" }
        end
      end
    end
  end
end
