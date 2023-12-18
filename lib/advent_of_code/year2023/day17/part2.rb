# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day17
      # https://adventofcode.com/2023/day/17
      class Part2 < Part1
        def initialize(input)
          super
          @heat_loss_diff = 30
        end

        private

        def can_use_direction?(check, direction, x, y)
          return false if backwards? direction, check.direction_history.last
          return false if max_blocks_in_one_direction? direction, 10, check.direction_history
          return false unless can_turn_now? direction, check.direction_history
          return false unless space_to_turn? direction, check.direction_history, check.x, check.y
          return false if invalid_coordinates? x, y
          return false if check.coord_history.include? [x, y]

          true
        end

        def can_turn_now?(direction, history)
          return true if history.empty?

          if history.size >= 4 && history.last(4).uniq.size == 1
            true
          else
            direction == history.last
          end
        end

        def space_to_turn?(direction, history, x, y)
          return true if direction == history.last

          case direction
          when :north then y >= 4
          when :east then x <= target_coords[0] - 4
          when :south then y <= target_coords[1] - 4
          when :west then x >= 4
          end
        end
      end
    end
  end
end
