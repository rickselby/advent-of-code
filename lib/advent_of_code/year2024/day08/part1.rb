# frozen_string_literal: true

require "matrix"

module AdventOfCode
  module Year2024
    module Day08
      # https://adventofcode.com/2024/day/8
      class Part1 < AdventOfCode::Part
        def result
          @antinodes = Set.new
          find_antinodes
          @antinodes.size
        end

        private

        def find_antinodes
          antennas.each do |antenna|
            coords(antenna).combination(2) do |a1, a2|
              calculate_antinodes a1, a2
            end
          end
        end

        def calculate_antinodes(node1, node2)
          a = Vector[*node1]
          b = Vector[*node2]
          diff = a - b
          add_antinode a + diff
          add_antinode b - diff
        end

        def in_map?(node)
          (0...max_x).cover?(node[0]) && (0...max_y).cover?(node[1])
        end

        def add_antinode(node)
          return unless in_map? node

          @antinodes << node
        end

        def coords(antenna)
          coords = []
          input_array.each_with_index do |row, y|
            row.each_with_index do |c, x|
              coords << [x, y] if c == antenna
            end
          end
          coords
        end

        def antennas
          @antennas ||= input_array.flatten.uniq.reject { it == "." }
        end

        def max_x
          @max_x ||= lines.first.size
        end

        def max_y
          @max_y ||= lines.size
        end
      end
    end
  end
end
