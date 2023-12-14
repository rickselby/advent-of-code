# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part2 < Part1
        def result
          map = transpose(lines)
          1_000_000_000.times do |loop_index|
            last_state = map.dup
            4.times do
              map = map.map { |l| slide l }
              map = rotate map
            end

            # TODO: we need to detect a loop, I think
            if last_state == map
              p loop_index
              break
            end
          end
          map.sum { |l| sum l }
        end

        private

        def rotate(map)
          transpose map.map(&:reverse)
        end

        def slide(line)
          last_space = 0
          new_line = []
          line.each_with_index do |char, index|
            case char
            when "#"
              last_space = index + 1
              new_line << "#"
            when "O"
              new_line[last_space] = "O"
              new_line << "." unless index == last_space
              last_space += 1
            else
              new_line << "."
            end
          end
          new_line
        end

        def sum(line)
          sum = 0
          line.each_char.with_index do |c, i|
            sum += line.size - i if c == "O"
          end
          sum
        end
      end
    end
  end
end
