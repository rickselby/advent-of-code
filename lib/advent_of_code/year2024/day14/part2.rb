# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day14
      # https://adventofcode.com/2024/day/14
      class Part2 < AdventOfCode::Part
        WIDTH = 101
        HEIGHT = 103

        def result
          robots = lines.map { |l| robot l }
          i = 0
          loop do
            i += 1
            robots.each(&:move)
            next unless i == 6398

            print_output robots.to_set(&:coords)
            $stdin.gets("\n")
          end
        end

        private

        def robot(line)
          Robot.new(*line.scan(/-?\d+/).map(&:to_i))
        end

        def print_output(coords)
          (0...HEIGHT).each do |y|
            (0...WIDTH).each do |x|
              if coords.include?([x, y])
                print "██"
              else
                print "  "
              end
            end
            print "\n"
          end
        end

        # Define a robot
        class Robot
          attr_reader :x, :y

          def initialize(x, y, v_x, v_y)
            @x = x
            @y = y
            @vx = v_x
            @vy = v_y
          end

          def move
            @x = (x + @vx) % Part2::WIDTH
            @y = (y + @vy) % Part2::HEIGHT
          end

          def coords
            [x, y]
          end
        end
      end
    end
  end
end
