# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day17
      # https://adventofcode.com/2024/day/17
      class Part1 < AdventOfCode::Part
        def result
          @out = []
          registers, program = lines.slice_when { |a, _| a == "" }.to_a
          load_registers registers
          run_program program
          @out.join ","
        end

        private

        def load_registers(registers)
          @a = registers[0].scan(/\d+/).map(&:to_i).first
          @b = registers[1].scan(/\d+/).map(&:to_i).first
          @c = registers[2].scan(/\d+/).map(&:to_i).first
        end

        def run_program(program)
          program = program.last.scan(/[\d,]+/).first.split(",").map(&:to_i)
          ptr = 0
          loop do
            instruction = program[ptr]
            operand = program[ptr + 1]

            advance = true
            case instruction
            when 0 then @a /= (2**combo(operand))
            when 1 then @b ^= operand
            when 2 then @b = combo(operand) % 8
            when 3
              break if @a.zero?

              ptr = operand
              advance = false
            when 4 then @b ^= @c
            when 5 then @out << (combo(operand) % 8)
            when 6 then @b = @a / (2**combo(operand))
            when 7 then @c = @a / (2**combo(operand))
            end

            ptr += 2 if advance

            return if ptr >= program.length
          end
        end

        def combo(operand)
          case operand
          when 0..3 then operand
          when 4 then @a
          when 5 then @b
          when 6 then @c
          end
        end
      end
    end
  end
end
