# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day14
      # https://adventofcode.com/2024/day/14
      class Part2 < Part1
        SECONDS = 6398

        def result
          print_output(lines.to_set { final_pos it })
          nil
        end

        private

        def print_output(coords)
          (0...@height).each do |y|
            (0...@width).each do |x|
              if coords.include?([x, y])
                print "██"
              else
                print "  "
              end
            end
            print "\n"
          end
        end
      end
    end
  end
end
