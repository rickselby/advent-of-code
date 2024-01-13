# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day08
      # https://adventofcode.com/2023/day/8
      class Part1 < AdventOfCode::Day
        def initialize(input)
          super(input)
          @nodes = {}
          parse_input
        end

        def result
          count_for_node "AAA", "ZZZ"
        end

        private

        def count_for_node(node, ends_with)
          count = 0
          @step = 0
          loop do
            count += 1
            node = @nodes[node][next_direction]

            break if node.end_with? ends_with
          end
          count
        end

        def parse_input
          lines.each_with_index do |line, index|
            line.strip!
            next if line.empty?

            if index.zero?
              parse_first_line line
            else
              parse_line line
            end
          end
        end

        def parse_first_line(line)
          @instructions = line
        end

        def parse_line(line)
          matches = line.match(/(?<source>.+) = \((?<left>.+), (?<right>.+)\)/)
          @nodes[matches[:source]] = { "L" => matches[:left], "R" => matches[:right] }
        end

        def next_direction
          @step = 0 if @step == @instructions.size
          @instructions[@step].tap { |_| @step += 1 }
        end
      end
    end
  end
end
