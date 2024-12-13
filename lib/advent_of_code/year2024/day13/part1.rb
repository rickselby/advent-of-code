# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day13
      # https://adventofcode.com/2024/day/13
      class Part1 < AdventOfCode::Part
        def result
          machine_lines.sum { |m| coins_for m }
        end

        private

        def machine_lines
          lines.slice_when { |a, _| a == "" }.to_a
        end

        def coins_for(m_lines)
          m = build_machine m_lines
          a, b = solve m
          (a * 3) + b
        end

        def build_machine(m_lines)
          ax, ay = m_lines[0].scan(/\d+/).map(&:to_i)
          bx, by = m_lines[1].scan(/\d+/).map(&:to_i)
          tx, ty = m_lines[2].scan(/\d+/).map(&:to_i)

          { ax:, ay:, bx:, by:, tx:, ty: }
        end

        def solve(machine)
          b = solve_b machine
          return [0, 0] unless b.to_int == b

          a = solve_a machine, b
          return [0, 0] unless a.to_int == a

          [a, b]
        end

        def solve_b(machine)
          ((machine[:tx] * machine[:ay]) - (machine[:ax] * machine[:ty])).fdiv(
            (machine[:bx] * machine[:ay]) - (machine[:ax] * machine[:by]),
          )
        end

        def solve_a(machine, b_value)
          (machine[:tx] - (machine[:bx] * b_value)).fdiv machine[:ax]
        end
      end
    end
  end
end
