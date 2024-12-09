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
          nils = nils(array)
          loop do
            v = array.pop
            i = nils.shift
            array[i] = v

            array.pop while array.last.nil?
            break if nils.first > array.size
          end
          array
        end

        def nils(array)
          array.map.with_index { |v, i| v.nil? ? i : nil }.compact
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
