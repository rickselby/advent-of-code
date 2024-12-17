# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day17
      # https://adventofcode.com/2024/day/17
      class Part1 < AdventOfCode::Part
        def result
          @out = []
          load_registers
          run_program
          @out.join ","
        end

        private

        def load_registers
          @a = lines[0].scan(/\d+/).map(&:to_i).first
          @b = lines[1].scan(/\d+/).map(&:to_i).first
          @c = lines[2].scan(/\d+/).map(&:to_i).first
        end

        def run_program
          @ptr = 0
          loop do
            @advance = true
            run_instruction program[@ptr], program[@ptr + 1]
            @ptr += 2 if @advance
            return if @ptr >= program.length
          end
        end

        def run_instruction(instruction, operand) # rubocop:disable Metrics/CyclomaticComplexity
          case instruction
          when 0 then @a = dv(operand)
          when 1 then bxl(operand)
          when 2 then @b = st(operand)
          when 3 then jnz(operand)
          when 4 then @b ^= @c
          when 5 then @out << st(operand)
          when 6 then @b = dv(operand)
          when 7 then @c = dv(operand)
          end
        end

        def dv(operand)
          @a / (2**combo(operand))
        end

        def bxl(operand)
          @b ^= operand
        end

        def st(operand)
          combo(operand) % 8
        end

        def jnz(operand)
          return if @a.zero?

          @ptr = operand
          @advance = false
        end

        def combo(operand)
          case operand
          when 0..3 then operand
          when 4 then @a
          when 5 then @b
          when 6 then @c
          end
        end

        def program
          @program ||= lines.last.scan(/[\d,]+/).first.split(",").map(&:to_i)
        end
      end
    end
  end
end
