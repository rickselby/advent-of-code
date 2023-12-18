# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part1 < AdventOfCode::Day
        def result
          @map = { 0 => { 0 => "" } }
          parse_digs
          print_map
          fill
        end

        private

        OPPOSITE = { "R" => "L", "L" => "R", "U" => "D", "D" => "U" }.freeze

        def parse_digs
          x = 0
          y = 0
          lines.map(&:strip).each do |line|
            x, y = dig_and_update_map x, y, line
          end
        end

        def dig_and_update_map(x, y, line)
          bits = line.split
          @map[y][x] += bits[0]
          x, y = dig x, y, bits[0], bits[1].to_i
          @map[y][x] += OPPOSITE[bits[0]]
          [x, y]
        end

        def dig(x, y, dir, length)
          length.times do |l|
            x, y = next_coords x, y, dir
            @map[y] ||= {}
            next unless @map.dig(y, x).nil?

            set_map_coord x, y, l == length - 1, dir
          end
          [x, y]
        end

        def set_map_coord(x, y, at_end, dir)
          @map[y][x] = if at_end
                         ""
                       elsif %w[U D].include? dir
                         "|"
                       else
                         "-"
                       end
        end

        def next_coords(x, y, dir)
          case dir
          when "U" then [x, y - 1]
          when "R" then [x + 1, y]
          when "D" then [x, y + 1]
          when "L" then [x - 1, y]
          end
        end

        def fill
          count = 0
          row_range.each do |row|
            inside = false
            turn = nil
            col_range.each do |col|
              inside, turn, v = check row, col, inside, turn
              count += v
            end
          end
          count
        end

        def check(row, col, inside, turn)
          val = @map.dig(row, col)&.chars&.sort&.join
          return [inside, turn, 0] if val.nil? && !inside

          inside, turn = check_again val, inside, turn

          [inside, turn, 1]
        end

        def check_again(val, inside, turn)
          case val
          when "|" then inside = !inside
          when "DR", "RU" then turn = val
          when "LU" then inside = !inside if turn == "DR"
          when "DL" then inside = !inside if turn == "RU"
          end

          [inside, turn]
        end

        def row_range
          @map.keys.min..@map.keys.max
        end

        def col_range
          rows = @map.values
          min = rows.map { |r| r.keys.min }.min
          max = rows.map { |r| r.keys.max }.max
          min..max
        end

        def print_map
          width = col_range.size
          offset = -col_range.min
          row_range.each do |row|
            str = " " * width
            @map[row].each do |k, v|
              str[k + offset] = v.size > 1 ? "T" : v
            end
            puts str
          end
        end
      end
    end
  end
end
