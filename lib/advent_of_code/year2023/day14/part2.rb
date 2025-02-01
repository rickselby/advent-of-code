# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day14
      # https://adventofcode.com/2023/day/14
      class Part2 < Part1
        LOOP_AMOUNT = 1_000_000_000

        def result
          @states = []
          @index = nil
          index = find_index transpose lines
          @states[index].sum { |l| sum l }
        end

        private

        def rotate(map)
          transpose map.map(&:reverse)
        end

        def sum(line)
          line.each_with_index.select { |c| c[0] == "O" }.sum { |_, i| line.size - i }
        end

        def find_index(map)
          LOOP_AMOUNT.times do |loop_index|
            # Rotate and slide 4 times
            4.times { map = rotate(map.map { |l| Line.new(l).slide }) }

            if @states.include? map
              previous_index = @states.index map
              return previous_index + ((LOOP_AMOUNT - previous_index - 1) % (loop_index - previous_index))
            end

            @states[loop_index] = map
          end
        end

        # Slide rocks in a single line
        class Line
          def initialize(line)
            @line = line
            @new_line = []
          end

          def slide
            @last_space = 0
            @line.each_with_index do |char, index|
              case char
              when "#" then add_static_rock index
              when "O" then move_rock index
              else add_space
              end
            end
            @new_line
          end

          private

          def add_static_rock(index)
            @last_space = index + 1
            @new_line << "#"
          end

          def move_rock(index)
            @new_line[@last_space] = "O"
            @new_line << "." unless index == @last_space
            @last_space += 1
          end

          def add_space
            @new_line << "."
          end
        end
      end
    end
  end
end
