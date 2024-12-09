# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day09
      # https://adventofcode.com/2024/day/9
      class Part1 < AdventOfCode::Part
        def result
          checksum compact filesystem
        end

        private

        def checksum(array)
          array.map.with_index { |v, i| v * i }.sum
        end

        def compact(array)
          loop do
            v = array.pop
            i = array.find_index(nil)
            array[i] = v

            array.pop while array.last.nil?
            break if array.none?(&:nil?)
          end
          array
        end

        def filesystem
          filesystem = []
          file_id = 0
          chars.map(&:to_i).each_with_index do |c, i|
            c.times { filesystem << ((i % 2).zero? ? file_id : nil) }
            file_id += 1 if (i % 2).zero?
          end
          filesystem
        end
      end
    end
  end
end
