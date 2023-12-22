# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day21
      # https://adventofcode.com/2023/day/21
      class Part2 < Part1
        STEPS = 26_501_365

        def result
          # load the distance and location of the exits
          first_exits

          # find out when the equilibrium hits for the middle tile
          middle = steps_to_equilibrium @start

          # find out when the equilibrium would hit for the left tile based on the left exit from the middle tile
          left = steps_to_equilibrium @exits[:left][0]
          # # turns out these are all the same so we can work with one corner and multiply by 4
          # right = steps_to_equilibrium @exits[:right][0]
          # top = steps_to_equilibrium @exits[:top][0]
          # bottom = steps_to_equilibrium @exits[:bottom][0]

          # work out the equilibrium for a diagonal entry
          diagonal = steps_to_equilibrium [0, 0]

          # which of the middle values do we use? depends on if total steps is odd or even
          middle_key = middle[:each_step].keys.reverse.find(&(STEPS.even? ? :even? : :odd?))
          middle_final_value = middle[:each_step][middle_key]

          puts "middle final value will be #{middle_final_value}"

          # now lets work on the left row of maps
          axes_start_at = @exits[:left][1]
          # work out how many maps are complete.
          # take the number of steps taken from entering the first map on the left
          #   and divide by the number of steps it takes to get to equilibrium
          # TODO: this is wrong!
          # total maps is based around map size; it takes that long to start a map,
          # and then the number of steps to complete it.
          # so it's probably steps - (steps to complete) % map size
          maps, remainder = (STEPS - axes_start_at).divmod left[:steps]

          # Get the width of the map
          map_size = @map.size

          # now we need to work out the final values for each of the completed maps

          # work out if the first map on the left will finish on the odd or even equilibrium
          # if the map starts at an even number (e.g. 10) then it will actually be offset odd/even from the middle
          # if the map starts at an odd number (e.g. 9) then it will match the middle
          odd_or_even = if axes_start_at.even?
                          STEPS.odd? ? :even : :odd
                        else
                          STEPS.odd? ? :odd : :even
                        end
          if map_size.even?
            # if the map size is even then we will always start a new map on the same (even / odd) step
            # so we can work out which that is, and multiply through
            key = left[:each_step].keys.reverse.find(&(odd_or_even == :even ? :even? : :odd?))
            left_completed_total = left[:each_step][key] * maps
          else
            # the map size is odd, so each map will alternate starting on an even and odd step
            evens = left[:each_step][left[:each_step].keys.reverse.find(&:even?)]
            odds = left[:each_step][left[:each_step].keys.reverse.find(&:odd?)]
            # this is fine as ruby integer division returns integers
            left_completed_total = (evens * maps / 2) + (odds * maps / 2)
            if maps.odd?
              # we need to add one more map on, but which one?
              # it's whatever the first one is
              left_completed_total += odd_or_even == :even ? evens : odds
            end
          end

          # Add the incomplete map to the end of the line
          left_completed_total += left[:each_step][remainder] unless remainder.zero?

          # we need to add another incomplete map if we have gone one more map along!
          left_completed_total += left[:each_step][remainder - map_size] if remainder > map_size

          # ok, we might now have the correct value of the row...
          puts "left completed maps total is #{left_completed_total}"

          # we need the diagonal pieces too
          # the total completed in a corner is the triangle number
          # e.g. if 5 are complete in the row, then 4 must be complete adjacent, then 3, 2, 1
          completed_in_diagonal = (maps - 1).then { |x| (x.pow(2) + x) / 2 }

          # we always hit a diagonal map on an odd
          # TODO: no we don't! it's always even, so they change. urgh.
          # find the correct equilibrium value
          key = diagonal[:each_step].keys.reverse.find(&(STEPS.even? ? :even? : :odd?))
          diagonal_completed_total = diagonal[:each_step][key] * completed_in_diagonal

          # calculate when we start the first diagonal map
          first_diagonal_starts_at = (@exits[:left][1] * 2) - 1
          # see how many more steps we take beyond the last completed diagonal
          diagonal_remainder = (STEPS - first_diagonal_starts_at) % map_size

          # big incomplete maps join the ends of the complete rows,
          # e.g. for 4 complete rows there are 4 big incomplete maps
          # .....
          # .   #
          # .  #
          # . #
          # .#
          big_incomplete = diagonal[:each_step][diagonal_remainder + map_size]
          # little incomplete are adjacent to two big incomplete maps (and the rows), so there is one extra
          little_incomplete = diagonal[:each_step][diagonal_remainder]

          puts "steps for diagonals (total #{diagonal[:steps]}): #{diagonal_remainder}, #{diagonal_remainder + map_size}"

          diagonal_completed_total += big_incomplete * maps
          diagonal_completed_total += little_incomplete * (maps + 1)

          # TODO: are there more incomplete maps here?

          puts "diagonal completed maps total is #{diagonal_completed_total}"

          total = middle_final_value + (4 * left_completed_total) + (4 * diagonal_completed_total)
          puts "total so far is #{total}"
          puts "n.b. 271343742308441 is too low and 271343742316329 is wrong."
          total
        end

        # def steps(steps)
        #   coords_list = {}
        #   coords_list[@start] = [[0, 0]]
        #   steps.times do
        #     coords_list = find_moves coords_list
        #   end
        #   coords_list.values.sum(&:size)
        # end

        def steps_to_equilibrium(start)
          step_values = {}
          steps = 0
          coords_list = Set.new [start]
          loop do
            coords_list = find_moves coords_list
            steps += 1
            step_values[steps] = coords_list.size
            last_values = step_values.values.last(4)
            break if last_values[0] == last_values[2] && last_values[1] == last_values[3]
          end
          { steps: steps - 2, each_step: step_values }
        end

        private

        def first_exits
          @exits = { left: nil, right: nil, top: nil, bottom: nil }
          coords_list = Set.new [@start]
          steps = 0
          loop do
            coords_list = find_exits coords_list, steps
            steps += 1
            break unless @exits.values.any?(nil)
          end
        end

        def find_exits(coords_list, steps)
          new_list = Set.new
          coords_list.each do |coords|
            possible_coords(coords).each do |poss|
              if invalid_coords poss
                add_exit poss, steps + 1
                next
              end

              new_list << poss unless rock? poss
            end
          end
          new_list
        end

        def add_exit(coords, steps)
          if coords[0].negative?
            @exits[:left] ||= [coords, steps]
          elsif coords[1].negative?
            @exits[:top] ||= [coords, steps]
          elsif coords[0] >= max_x
            @exits[:right] ||= [coords, steps]
          elsif coords[1] >= max_y
            @exits[:bottom] ||= [coords, steps]
          end
        end

        #
        # def find_moves(coords_list)
        #   new_list = {}
        #   coords_list.each do |coords, maps|
        #     possible_coords(coords).each do |poss|
        #       next if rock? poss
        #
        #       if new_map poss
        #         these_maps = translate_maps maps, poss
        #         poss = translate poss
        #       else
        #         these_maps = maps
        #       end
        #
        #       new_list[poss] = if new_list.key? poss
        #                          (new_list[poss] + these_maps).uniq
        #                        else
        #                          these_maps
        #                        end
        #     end
        #   end
        #   new_list
        # end
        #
        # def rock?(coords)
        #   x, y = translate coords
        #   @map[y][x] == "#"
        # end
        #
        # def new_map(coords)
        #   coords[0].negative? || coords[1].negative? || coords[0] >= max_x || coords[1] >= max_y
        # end
        #
        def translate(coords)
          [
            coords[0] % max_x,
            coords[1] % max_y
          ]
        end

        #
        # def translate_maps(maps, coords)
        #   maps.map { |m| translate_map m, coords }
        # end
        #
        # def translate_map(map, coords)
        #   return [map[0] - 1, map[1]] if coords[0].negative?
        #   return [map[0], map[1] - 1] if coords[1].negative?
        #   return [map[0] + 1, map[1]] if coords[0] >= max_x
        #
        #   [map[0], map[1] + 1] if coords[1] >= max_y
        # end
      end
    end
  end
end
