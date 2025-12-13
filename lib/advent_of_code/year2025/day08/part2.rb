# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day08
      # https://adventofcode.com/2025/day/8
      class Part2 < Part1
        def result
          @nodes = []
          @distances = {}
          parse_input
          calculate_distances
          sort_distances
          @networks = []
          nodes = link_nodes
          @nodes[nodes[0]][0] * @nodes[nodes[1]][0]
        end

        private

        def sort_distances
          @distances = @distances.sort_by { |_, v| v }.to_h
        end

        def link_nodes
          @distances.each_key do |k|
            matched_networks = []
            @networks.each do |network|
              matched_networks << network if network.include?(k[0]) || network.include?(k[1])
            end
            handle_matched_networks matched_networks, k
            return k if @networks.size == 1 && @networks.first.size == @nodes.size
          end
        end
      end
    end
  end
end
