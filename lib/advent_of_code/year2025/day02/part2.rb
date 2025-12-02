# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day02
      # https://adventofcode.com/2025/day/2
      class Part2 < Part1
        private

        def repeated?(num)
          str = num.to_s

          (1..(str.length / 2)).each do |size|
            next unless (str.length % size).zero?

            part = str[0, size]
            return true if str == part.ljust(str.length, part)
          end

          false
        end
      end
    end
  end
end
