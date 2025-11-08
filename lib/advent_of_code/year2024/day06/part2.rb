# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day06
      # https://adventofcode.com/2024/day/6
      class Part2 < Part1
        def result
          map, start = parse_map

          loops = 0
          walked_spots(map, start).each do |y, x|
            new_map = deep_dup map
            new_map[y][x] = "#"

            loops += 1 if loop? new_map, start, :up
          end

          loops
        end

        private

        def walked_spots(map, start)
          walked_map = deep_dup map
          walk walked_map, start, :up

          walked_map.transform_values { it.select { |_, w| w == "X" } }
                    .to_h { |k, v| [k, v.map { |l, _| [k, l] }] }
                    .values
                    .flatten(1)
                    .compact
        end

        def loop?(map, pos, dir)
          visited = Set.new

          loop do
            visited << [pos, dir]
            pos, dir = move map, pos, dir

            break if out_of_bounds? pos
            return true if visited.include? [pos, dir]
          end

          false
        end

        def deep_dup(hash)
          result = {}
          hash.each do |k, v|
            result[k] = if v.is_a?(Hash)
                          deep_dup(v)
                        else
                          v
                        end
          end
          result
        end
      end
    end
  end
end
