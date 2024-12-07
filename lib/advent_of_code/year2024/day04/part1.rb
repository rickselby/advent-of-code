# frozen_string_literal: true

require "matrix"

module AdventOfCode
  module Year2024
    module Day04
      # https://adventofcode.com/2024/day/4
      class Part1 < AdventOfCode::Part
        MATCH = "XMAS"

        def result
          all_lines.sum { |l| l.scan(MATCH).size }
        end

        private

        def all_lines
          [
            lines,
            lines.map(&:reverse),
            transposed,
            transposed.map(&:reverse),
            diagonals_l_r,
            diagonals_l_r.map(&:reverse),
            diagonals_r_l,
            diagonals_r_l.map(&:reverse),
          ].flatten
        end

        def transposed
          @transposed ||= input_array.transpose.map(&:join)
        end

        def diagonals_l_r
          @diagonals_l_r ||= diagonals(input_array)
        end

        def diagonals_r_l
          @diagonals_r_l ||= diagonals(input_array.reverse)
        end

        def diagonals(arr)
          nil_array = [nil]
          padding = [*0..(arr.length - 1)].map { |i| nil_array * i }
          padded = padding.reverse.zip(arr).zip(padding).map(&:flatten)
          padded.transpose.map { |x| x.compact.join }
        end
      end
    end
  end
end
