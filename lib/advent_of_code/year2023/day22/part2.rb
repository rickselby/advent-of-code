# frozen_string_literal: true

# Hmm. 2113 is too low. But I don't see what I'm missing...

class AdventOfCode
  module Year2023
    module Day22
      # https://adventofcode.com/2023/day/22
      class Part2 < Part1
        def result
          @blocks = []
          @cubes = Set.new
          parse_input
          settle_all
          count_movement
        end

        private

        def count_movement
          @blocks = @blocks.each_with_index.map { |b, i| { index: i, block: b } }
          @blocks.sum do |block|
            without_coords block[:block] do
              initial_blocks = @blocks.reject { |b| b == block }
              settled_blocks = settle_all2 initial_blocks.dup
              (initial_blocks - settled_blocks).size
            end
          end
        end

        def settle_all2(blocks)
          loop do
            changes = false
            blocks.each_with_index do |b, i|
              changed = settle2 b.dup, i, blocks
              changes ||= changed
            end
            break unless changes
          end
          blocks
        end

        def settle2(block, index, blocks)
          block[:block].each { |coords| @cubes.delete coords }
          block[:block] = drop_block block[:block]
          block[:block].each { |coords| @cubes << coords }

          return false if blocks[index] == block

          blocks[index] = block
          true
        end
      end
    end
  end
end
