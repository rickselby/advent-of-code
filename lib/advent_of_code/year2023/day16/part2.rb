# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day16
      # https://adventofcode.com/2023/day/16
      class Part2 < Part1
        def initialize(input)
          super
          @checking = []
          @cached = {}
        end

        def result
          max = 0
          all_starts.each do |x, y, dir|
            @energised = []
            @checked = []
            count = coords_only(coords_from(x, y, dir)).size
            puts "#{x}, #{y}, #{dir} = #{count}"
            max = [max, count].max
          end
          max
        end

        def all_starts
          top_row = Array.new(input_array[0].size) { |x| [x, 0, :south] }
          bottom_row = Array.new(input_array[0].size) { |x| [x, input_array.size - 1, :north] }
          left_col = Array.new(input_array.size) { |y| [0, y, :east] }
          right_col = Array.new(input_array.size) { |y| [input_array[0].size - 1, y, :west] }

          top_row + bottom_row + left_col + right_col
        end

        private

        def coords_only(directions)
          directions.map { |x, y, _| [x, y] }.uniq
        end

        def coords_from(x, y, direction, previous = [])
          return previous if invalid_coordinates? x, y

          key = [x, y, direction]
          return previous if previous.include? key

          next_positions(*key).each_with_object([]) do |k, coords|
            coords.concat(coords_from(*k, previous + [key])).uniq
          end
        end

        def next_positions(x, y, direction)
          case input_array[y][x]
          when "." then [continue(x, y, direction)]
          when "-" then splitter(x, y, direction, %i[east west])
          when "|" then splitter(x, y, direction, %i[north south])
          when "\\", "/" then mirror(x, y, direction, input_array[y][x])
          end
        end

        def splitter(x, y, direction, passthrough)
          return [continue(x, y, direction)] if passthrough.include? direction

          [
            continue(x, y, TURNS[direction][:left]),
            continue(x, y, TURNS[direction][:right])
          ]
        end

        def mirror(x, y, direction, mirror)
          [
            continue(x, y, MIRRORS[mirror][direction])
          ]
        end

        def energise(x, y, direction)
          key = [x, y, direction]
          if @checking.include? key
            puts "CHECKING #{key}"
            return []
          end
          return [] if invalid_coordinates? x, y

          unless @cached.key? key
            @checking << key
            @cached[key] = ([[x, y]] + move(x, y, direction)).compact.uniq
            @checking.delete key
          else
            puts "CACHE HIT #{key} = #{@cached[key]}"
          end

          @cached[key]
        end

        def get_coords_from(x, y, direction)

        end
      end
    end
  end
end
