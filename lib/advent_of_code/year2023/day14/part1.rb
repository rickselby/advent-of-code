# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part1 < AdventOfCode::Part
        def result
          transpose(lines).then { |lines| lines.sum { |l| Line.new(l).count_slides } }
        end

        private

        def lines
          @lines ||= super.map { |l| l.strip.chars }
        end

        def transpose(map)
          map[0].zip(*map[1..])
        end

        # Parse a single line
        class Line
          def initialize(line)
            @line = line
          end

          def count_slides
            @last_space = @line.size
            @rocks = []
            @line.each_with_index do |char, index|
              case char
              when "#" then update_last_space index
              when "O" then add_rock
              end
            end
            @rocks.sum
          end

          private

          def update_last_space(index)
            @last_space = @line.size - index - 1
          end

          def add_rock
            @rocks << @last_space
            @last_space -= 1
          end
        end
      end
    end
  end
end
