# frozen_string_literal: true

class AdventOfCode
  module Y2023
    # https://adventofcode.com/2023/day/8
    class Day8b < Day8a
      def result
        starting_nodes.map { |node| count_for_node node, "Z" }
                      .reduce(1, :lcm)
      end

      private

      def starting_nodes
        @nodes.keys.select { |k| k.end_with? "A" }
      end
    end
  end
end
