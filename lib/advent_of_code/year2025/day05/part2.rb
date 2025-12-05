# frozen_string_literal: true

module AdventOfCode
  module Year2025
    module Day05
      # https://adventofcode.com/2025/day/5
      class Part2 < Part1
        def result
          @ranges = []
          @ingredients = []
          parse_input

          @fixed_ranges = []
          fix_ranges

          @fixed_ranges.sum(&:size)
        end

        private

        def fix_ranges
          loop do
            break if @ranges.empty?

            range = @ranges.pop

            loop do
              to_delete = []
              @ranges.each do |r|
                next unless range.overlap? r

                to_delete << r
                range = ([r.begin, range.begin].min)..([r.end, range.end].max)
              end

              break if to_delete.empty?

              to_delete.each { @ranges.delete it }
            end

            @fixed_ranges << range
          end
        end
      end
    end
  end
end
