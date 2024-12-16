# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day16
      # https://adventofcode.com/2024/day/16
      class Part1 < AdventOfCode::Part
        def result
          @map = AdventOfCode::Helpers::Map.new(input_array)
          @costs = { start => 0 }
          parse start, 0
          @costs[@map.find("E")]
          ends.map { |e| @costs[e] }.compact.min
        end

        private

        def parse(cwd, score)
          check_move cwd.rotate(:cw), score + 1000
          check_move cwd.rotate(:ccw), score + 1000
          check_move cwd.forward, score + 1
        end

        def check_move(cwd, score)
          return if @map[cwd] == "#"
          return if @costs.key?(cwd) && @costs[cwd] <= score

          @costs[cwd] = score
          parse cwd, score
        end

        def start
          c = @map.find "S"
          CoordinatesWithDirection.new c.x, c.y, :east
        end

        def ends
          e = @map.find "E"
          %i[north east south west].map { |d| CoordinatesWithDirection.new e.x, e.y, d }
        end

        # Add a direction to coordinates
        class CoordinatesWithDirection < AdventOfCode::Helpers::Coordinates
          attr_reader :direction

          def initialize(x, y, direction)
            super(x, y)
            @direction = direction
          end

          def ==(other)
            super && (direction == other.direction)
          end

          def forward
            self.dup.move(direction)
          end

          ROTATE_CW = { north: :east, east: :south, south: :west, west: :north }.freeze
          ROTATE_CCW = { north: :west, west: :south, south: :east, east: :north }.freeze

          def rotate(dir)
            case dir
            when :cw then self.class.new(x, y, ROTATE_CW[direction])
            when :ccw then self.class.new(x, y, ROTATE_CCW[direction])
            end
          end

          def eql?(other)
            self.==(other)
          end

          def hash
            [x, y, direction].hash
          end
        end
      end
    end
  end
end
