# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part2 < Part1
        def result
          states = []
          index = nil
          map = transpose(lines)
          loop_amount = 1_000_000_000
          loop_amount.times do |loop_index|
            4.times do
              map = map.map { |l| slide l }
              map = rotate map
            end

            if states.include? map
              previous_index = states.index map
              index = previous_index + ((loop_amount - previous_index - 1) % (loop_index - previous_index))
              break
            end

            states[loop_index] = map
          end

          states[index].sum { |l| sum l }
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
          line.each_with_index do |c, i|
            sum += line.size - i if c == "O"
          end
          sum
        end
      end
    end
  end
end
