# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day18
      # https://adventofcode.com/2023/day/18
      class Part1 < AdventOfCode::Day
        def result
          @map = { 0 => { 0 => "" } }
          parse_digs
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
          bits = parse_line line
          @map[y][x] += bits[0]
          x, y = dig x, y, bits[0], bits[1].to_i
          @map[y][x] += OPPOSITE[bits[0]]
          [x, y]
        end

        def parse_line(line)
          bits = line.split
          [bits[0], bits[1]]
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
          if at_end
            @map[y][x] = ""
          elsif %w[U D].include? dir
            @map[y][x] = "|"
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
          previous_rows = {}
          row_range.inject(0) do |count, row|
            previous_row_key = @map[row].sort.join ":"
            next count + previous_rows[previous_row_key] if previous_rows.key? previous_row_key

            row_count = fill_row row
            previous_rows[previous_row_key] = row_count
            count + row_count
          end
        end

        def fill_row(row)
          turn = nil
          pre_turn = nil
          last_state = { col: 0, inside: false }
          @map[row].sort.to_h.keys.inject(0) do |count, col|
            count += (col - last_state[:col]) if last_state[:inside]
            inside, turn, pre_turn = check row, col, last_state[:inside], turn, pre_turn
            count += 1 if !last_state[:inside] && inside
            last_state = { col:, inside: }
            count
          end
        end

        def check(row, col, inside, turn, pre_turn)
          val = @map.dig(row, col).chars.sort.join

          inside, turn, pre_turn = check_again val, inside, turn, pre_turn

          [inside, turn, pre_turn]
        end

        def check_again(val, inside, turn, pre_turn)
          case val
          when "|" then inside = !inside
          when "DR", "RU"
            turn = val
            pre_turn = inside
            inside = true
          when "LU" then inside = turn == "DR" ? !pre_turn : pre_turn
          when "DL" then inside = turn == "RU" ? !pre_turn : pre_turn
          end

          [inside, turn, pre_turn]
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

        # def print_map
        #   width = col_range.size
        #   offset = -col_range.min
        #   row_range.each do |row|
        #     str = " " * width
        #     @map[row].each do |k, v|
        #       str[k + offset] = v.size > 1 ? "T" : v
        #     end
        #     puts str
        #   end
        # end
      end
    end
  end
end
