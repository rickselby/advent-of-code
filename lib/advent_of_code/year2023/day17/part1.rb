# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day17
      # https://adventofcode.com/2023/day/17
      class Part1 < AdventOfCode::Day
        def result
          @history = {}
          @minimums = {}
          @previous_checks = Set.new
          @checks = [
            { x: 0, y: 0, heat_loss: 0, direction_history: [], coord_history: Set.new }
          ]
          data = run_checks
          puts data[1]
          data[0]
        end

        private

        DIRECTIONS = %i[north east south west].freeze

        def target_coords
          @target_coords ||= [input_array.size - 1, input_array[0].size - 1]
        end

        def run_checks
          loop do
            sort_checks
            check = @checks.shift
            puts "#{@checks.size} - #{check.slice(:x, :y, :heat_loss)}"

            DIRECTIONS.each do |direction|
              next if backwards? direction, check[:direction_history].last
              next if three_blocks_in_one_direction? direction, check[:direction_history]

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
              next if @minimums.key?([x, y]) && (@minimums[[x, y]] + 10) < new_check[:heat_loss]

              return [new_check[:heat_loss], new_check[:direction_history]] if target_coords == [x, y]

              add_check = true

              if been_this_way_before? new_check
                matching_checks(new_check).each do |other_check|
                  @checks.delete other_check if other_check[:heat_loss] > new_check[:heat_loss]
                  add_check = false unless new_check[:heat_loss] < other_check[:heat_loss]
                end
              end

              next unless add_check

              @checks << new_check
              store_minimum new_check
              store_here new_check
            end
          end
        end

        def sort_checks
          @checks = @checks.sort_by { |c| [c[:heat_loss], -c[:direction_history].size] }
        end

        def coords_in_direction(x, y, direction)
          case direction
          when :north then [x, y - 1]
          when :east then [x + 1, y]
          when :south then [x, y + 1]
          when :west then [x - 1, y]
          end
        end

        def invalid_coordinates?(x, y)
          x.negative? || y.negative? || y == input_array.size || x == input_array[0].size
        end

        BACKWARDS = { north: :south, east: :west, south: :north, west: :east }.freeze

        def backwards?(direction, last_direction)
          direction == BACKWARDS[last_direction]
        end

        def three_blocks_in_one_direction?(direction, last_directions)
          return false if last_directions.size < 3

          last_directions.last(3).all?(direction)
        end

        def been_this_way_before?(check)
          return false if check[:direction_history].last(2).uniq.size == 1

          @previous_checks.include? dupe_key(check)
        end

        def matching_checks(check)
          @checks.select do |c|
            c[:x] == check[:x] &&
              c[:y] == check[:y] &&
              c[:direction_history].last(2).uniq.size != 1 &&
              c[:direction_history].last == check[:direction_history].last
          end
        end

        def store_here(check)
          return if check[:direction_history].last(2).uniq.size == 1

          @previous_checks.add dupe_key(check)
        end

        def dupe_key(check)
          [check[:x], check[:y], check[:direction_history].last]
        end

        def store_minimum(check)
          key = [check[:x], check[:y]]
          @minimums[key] = @minimums.key?(key) ? [@minimums[key], check[:heat_loss]].min : check[:heat_loss]
        end
      end
    end
  end
end
