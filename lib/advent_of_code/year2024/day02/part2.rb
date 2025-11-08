# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day02
      # https://adventofcode.com/2024/day/2
      class Part2 < Part1
        def result
          reports.count { safe_with_damping? it }
        end

        private

        def safe_with_damping?(report)
          return true if safe? report

          report.count.times do |c|
            return true if safe?(report.reject.with_index { |_, i| i == c })
          end

          false
        end
      end
    end
  end
end
