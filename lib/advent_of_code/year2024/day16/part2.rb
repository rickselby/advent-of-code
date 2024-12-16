# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day16
      # https://adventofcode.com/2024/day/16
      class Part2 < Part1
        def result
          load_finishes
          min_cost = ends.filter_map { |e| @costs[e] }.min
          @finishes.select { |f| f.score == min_cost }
                   .flat_map(&:coords)
                   .map(&:coordinates)
                   .uniq
                   .length
        end

        def load_finishes
          @map = AdventOfCode::Helpers::Map.new(input_array)
          @costs = { start => 0 }
          @finishes = []
          @check = [Path.new([start], 0)]
          do_checks
        end

        def do_checks
          loop do
            path = @check.shift
            cwd = path.coords.last

            if @map[cwd] == "E"
              @finishes << path
            else
              check_moves cwd, path
            end

            break if @check.empty?
          end
        end

        def check_moves(cwd, path)
          check_move cwd.rotate(:cw), 1000, path
          check_move cwd.rotate(:ccw), 1000, path
          check_move cwd.forward, 1, path
        end

        def check_move(cwd, cost, path)
          return if @map[cwd] == "#"

          new_path = path.copy
          new_path.add(cwd, cost)
          return if @costs.key?(cwd) && @costs[cwd] < new_path.score

          @costs[cwd] = new_path.score
          @check << new_path
        end

        # Store an individual path
        class Path
          attr_reader :coords, :score

          def initialize(coords = [], score = 0)
            @score = score
            @coords = coords
          end

          def add(coord, cost)
            @coords << coord
            @score += cost

            self
          end

          def copy
            self.class.new(coords.dup, score)
          end
        end
      end
    end
  end
end
