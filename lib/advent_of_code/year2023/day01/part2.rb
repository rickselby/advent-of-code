# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day01
      # https://adventofcode.com/2023/day/1
      class Part2 < Part1
        NUMBERS = {
          "one"   => 1,
          "two"   => 2,
          "three" => 3,
          "four"  => 4,
          "five"  => 5,
          "six"   => 6,
          "seven" => 7,
          "eight" => 8,
          "nine"  => 9,
        }.freeze

        def value_for_line(line)
          matches = get_matches line

          "#{matches.first}#{matches.last}".to_i
        end

        private

        # Build an indexed list of matches of all strings / numbers, so we can find the first and last matches
        def get_matches(line)
          matches = {}
          search_strings.each do |search|
            index = -1
            loop do
              index = line.index(search.to_s, index + 1)
              break if index.nil?

              matches[index] = search.is_a?(Integer) ? search : NUMBERS[search]
            end
          end

          matches.sort.to_h.values
        end

        def search_strings
          @search_strings ||= (NUMBERS.keys + NUMBERS.values)
        end
      end
    end
  end
end
