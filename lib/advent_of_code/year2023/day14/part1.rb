# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part1 < AdventOfCode::Day
        def result
          transpose(lines).then { |lines| lines.sum { |l| slide_rocks l } }
        end

        private

        def transpose(map)
          map.map(&:chars)
             .then { |m| m[0].zip(*m[1..]) }
             .map(&:join)
        end

        def slide_rocks(line)
          last_space = line.size
          circular_rocks = []
          line.chars.each_with_index do |char, index|
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
