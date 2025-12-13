# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day08
      # https://adventofcode.com/2025/day/8
      class Part1 < AdventOfCode::Part
        def result(connections = 1000)
          @nodes = []
          @distances = {}
          parse_input
          calculate_distances
          get_closest_distances connections
          @networks = []
          link_nodes
          @networks.map(&:size).uniq.sort.reverse.take(3).reduce(1) { |r, v| r * v }
        end

        private

        def parse_input
          lines.each { @nodes << it.split(",").map(&:to_i) }
        end

        def calculate_distances
          @nodes.each_with_index do |node, index|
            @nodes[(index + 1)..].each_with_index do |other_node, other_index|
              @distances[[index, other_index + index + 1]] = calculate_distance(node, other_node)
            end
          end
        end

        def get_closest_distances(connections)
          @distances = @distances.sort_by { |_, v| v }.take(connections).to_h
        end

        def link_nodes
          @distances.each_key do |k|
            matched_networks = []
            @networks.each do |network|
              matched_networks << network if network.include?(k[0]) || network.include?(k[1])
            end
            handle_matched_networks matched_networks, k
          end
        end

        def handle_matched_networks(matched_networks, coords)
          network = case matched_networks.size
                    when 1 then matched_networks.first
                    when 2 then matched_networks[0] + matched_networks[1]
                    else Set.new
                    end
          matched_networks.each { @networks.delete it }
          @networks << (network + coords)
        end

        def calculate_distance(x, y)
          Math.sqrt(((x[0] - y[0])**2) + ((x[1] - y[1])**2) + ((x[2] - y[2])**2))
        end
      end
    end
  end
end
