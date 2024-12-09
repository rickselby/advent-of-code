# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day09
      # https://adventofcode.com/2024/day/9
      class Part2 < Part1
        private

        def checksum(array)
          array.map.with_index { |v, i| v.nil? ? 0 : v * i }.sum
        end

        def compact(array)
          nils = nils(array)
          files = files(array)

          until files.empty?
            file_indexes = files.pop
            nils_index = nils.find_index { |n| n.size >= file_indexes.size }
            next if nils_index.nil? || nils[nils_index].first > file_indexes.first

            move_file array, file_indexes, nils, nils_index
          end
          array
        end

        def move_file(array, file_indexes, nils, nils_index)
          file_indexes.each do |i|
            array[nils[nils_index].shift] = array[i]
            array[i] = nil
          end
        end

        def nils(array)
          super.slice_when { |p, c| c != p.next }.to_a
        end

        def files(array)
          array.map.with_index { |v, i| v.nil? ? nil : i }.compact.slice_when { |p, c| array[p] != array[c] }.to_a
        end
      end
    end
  end
end
