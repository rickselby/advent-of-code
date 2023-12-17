# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day17
      # https://adventofcode.com/2023/day/17
      class Part2 < Part1
        private

        def run_checks
          loop do
            sort_checks
            check = @checks.shift
            puts "#{@checks.size} - #{check.slice(:x, :y, :heat_loss)}"

            DIRECTIONS.each do |direction|
              next if backwards? direction, check[:direction_history].last
              next if ten_blocks_in_one_direction? direction, check[:direction_history]
              next unless can_turn_now? direction, check[:direction_history]
              next unless has_space_to_turn? direction, check[:direction_history], check[:x], check[:y]

              x, y = coords_in_direction(check[:x], check[:y], direction)
              next if invalid_coordinates? x, y
              next if check[:coord_history].include? [x, y]

              new_check = {
                x:,
                y:,
                heat_loss: check[:heat_loss] + input_array[y][x].to_i,
                direction_history: check[:direction_history] + [direction],
                coord_history: check[:coord_history].dup.add([x, y])
              }

              # don't backtrack so far that it's pointless
              next if @minimums.key?([x, y]) && (@minimums[[x, y]] + 30) < new_check[:heat_loss]

              return [new_check[:heat_loss], new_check[:direction_history]] if target_coords == [x, y]

              add_check = true

              if been_this_way_before? new_check
                old_check = @possible_dupes[dupe_key(new_check)]
                @checks.delete old_check if old_check[:heat_loss] > new_check[:heat_loss]
                add_check = false unless new_check[:heat_loss] < old_check[:heat_loss]
              end

              next unless add_check

              @checks << new_check
              store_minimum new_check
              store_here new_check
            end
          end
        end

        def can_turn_now?(direction, history)
          return true if history.empty?

          if history.size >= 4 && history.last(4).uniq.size == 1
            true
          else
            direction == history.last
          end
        end

        def has_space_to_turn?(direction, history, x, y)
          return true if direction == history.last

          case direction
          when :north then y >= 4
          when :east then x <= target_coords[0] - 4
          when :south then y <= target_coords[1] - 4
          when :west then x >= 4
          end
        end

        def ten_blocks_in_one_direction?(direction, last_directions)
          return false if last_directions.size < 10

          last_directions.last(10).all?(direction)
        end
      end
    end
  end
end
