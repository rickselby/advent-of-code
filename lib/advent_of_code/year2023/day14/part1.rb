# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part1 < AdventOfCode::Day
        def result
          transpose(lines).then { |lines| lines.sum { |l| count_slides l } }
        end

        private

        def lines
          @lines ||= super.map { |l| l.strip.chars }
        end

        def transpose(map)
          map[0].zip(*map[1..])
        end

        def count_slides(line) # rubocop:disable Metrics/MethodLength
          last_space = line.size
          circular_rocks = []
          line.each_with_index do |char, index|
            case char
            when "#"
              last_space = line.size - index - 1
            when "O"
              circular_rocks << last_space
              last_space -= 1
            end
          end
          circular_rocks.sum
        end
      end
    end
  end
end
