# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day17
      # https://adventofcode.com/2023/day/17
      class Part1 < AdventOfCode::Day
        def initialize(input)
          super
          @heat_loss_diff = 10
        end

        def result
          @history = {}
          @minimums = {}
          @possible_dupes = {}
          @checks = [Check.new(0, 0, 0, [], Set.new)]
          run_checks
        end

        private

        DIRECTIONS = %i[north east south west].freeze

        def target_coords
          @target_coords ||= [input_array[0].size - 1, input_array.size - 1]
        end

        def run_checks
          loop do
            check = @checks.sort!.shift
            # puts "#{@checks.size} - #{check.slice(:x, :y, :heat_loss)}"

            DIRECTIONS.each do |direction|
              val = check_direction check, direction
              return val unless val.nil?
            end
          end
        end

        def check_direction(check, direction)
          x, y = coords_in_direction check.x, check.y, direction
          return unless can_use_direction? check, direction, x, y

          new_check = get_new_check check, x, y, direction

          return new_check.heat_loss if target_coords == [x, y]

          # don't backtrack so far that it's pointless
          return if heat_loss_too_high? new_check
          return if been_this_way_before?(new_check) && !(new_visit_is_better? new_check)

          store_new_check new_check

          nil
        end

        def new_visit_is_better?(check)
          old_check = @possible_dupes[check.dupe_key]
          @checks.delete old_check if old_check.heat_loss > check.heat_loss
          check.heat_loss < old_check.heat_loss
        end

        def heat_loss_too_high?(check)
          @minimums.key?(check.coords) && (@minimums[check.coords] + @heat_loss_diff) < check.heat_loss
        end

        def store_new_check(check)
          @checks << check
          store_minimum check
          store_here check
        end

        def get_new_check(check, x, y, direction)
          Check.new x,
                    y,
                    check.heat_loss + input_array[y][x].to_i,
                    check.direction_history + [direction],
                    check.coord_history.dup.add([x, y])
        end

        def can_use_direction?(check, direction, x, y)
          return false if backwards? direction, check.direction_history.last
          return false if max_blocks_in_one_direction? direction, 3, check.direction_history
          return false if invalid_coordinates? x, y
          return false if check.coord_history.include? [x, y]

          true
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

        def max_blocks_in_one_direction?(direction, max, last_directions)
          return false if last_directions.size < max

          last_directions.last(max).all?(direction)
        end

        def been_this_way_before?(check)
          return false if check.direction_history.last(2).uniq.size == 1

          @possible_dupes.key? check.dupe_key
        end

        def store_here(check)
          return if check.direction_history.last(2).uniq.size == 1

          @possible_dupes[check.dupe_key] = check
        end

        def store_minimum(check)
          @minimums[check.coords] = if @minimums.key?(check.coords)
                                      [@minimums[check.coords], check.heat_loss].min
                                    else
                                      check.heat_loss
                                    end
        end

        # Things for a single check
        class Check
          include Comparable

          attr_reader :x, :y, :heat_loss, :direction_history, :coord_history

          def initialize(x, y, heat_loss, direction_history, coord_history)
            @x = x
            @y = y
            @heat_loss = heat_loss
            @direction_history = direction_history
            @coord_history = coord_history
          end

          def coords
            [x, y]
          end

          def dupe_key
            [x, y, direction_history.last]
          end

          def comparison_key
            [heat_loss, -direction_history.size]
          end

          def <=>(other)
            comparison_key <=> other.comparison_key
          end
        end
      end
    end
  end
end
