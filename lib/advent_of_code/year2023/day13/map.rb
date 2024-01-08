# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day13
      # Checks for each map
      class Map
        def initialize(map)
          @map = map
        end

        def value
          mirror_line_value mirror_line @map
        end

        def smudged_value
          @original = mirror_line @map
          smudges(@map) do |smudged_map|
            line = mirror_line smudged_map
            return mirror_line_value line unless line.nil?
          end
        end

        private

        def mirror_line(map)
          row_value = check_map map, :row
          return row_value unless row_value.nil?

          col_value = transpose(map).then { |m| check_map m, :col }
          return col_value unless col_value.nil?

          nil
        end

        def mirror_line_value(line)
          (line[0] == :row) ? line[1] * 100 : line[1]
        end

        def check_map(map, type)
          map.size.times do |index|
            return [type, index + 1] if check_mirror(map, index) && allowed?(type, index + 1)
          end

          nil
        end

        def allowed?(type, value)
          return true if @original.nil?

          @original != [type, value]
        end

        def check_mirror(map, left, right = left + 1, first: true)
          return !first if left.negative? || right >= map.size

          (map[left] == map[right]) ? check_mirror(map, left - 1, right + 1, first: false) : false
        end

        def transpose(map)
          map.map(&:chars)
             .then { |m| m[0].zip(*m[1..]) }
             .map(&:join)
        end

        def smudges(map)
          map.each_with_index do |row, r_idx|
            row.size.times do |c_idx|
              original_value = row[c_idx]
              map[r_idx][c_idx] = ((original_value == "#") ? "." : "#")

              yield map
              map[r_idx][c_idx] = original_value
            end
          end
        end
      end
    end
  end
end
