# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day17
      # https://adventofcode.com/2024/day/17
      class Part2 < Part1
        def result
          a = 8**(program.length - 1)
          loop do
            load_registers
            @a = a
            @out = []
            run_program

            break if @out == program

            a = update a
          end
          a
        end

        private

        def load_registers
          @b = lines[1].scan(/\d+/).map(&:to_i).first
          @c = lines[2].scan(/\d+/).map(&:to_i).first
        end

        def update(a_value)
          (1..program.length).each do |i|
            next if @out[-i] == program[-i]

            return a_value + (8**(program.length - i))
          end
        end
      end
    end
  end
end
