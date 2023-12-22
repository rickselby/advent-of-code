# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day22
      # https://adventofcode.com/2023/day/22
      class Part1 < AdventOfCode::Day
        def result
          @blocks = []
          @cubes = Set.new
          parse_input
          p "settling... #{Time.now}"
          settle_all
          p "counting... #{Time.now}"
          try_disintegrate
        end

        private

        def parse_input
          lines.map(&:strip).each do |line|
            from, to = line.split("~").map { |l| l.split(",").map(&:to_i) }
            @blocks << fill_in_blocks([from, to])
          end
        end

        def fill_in_blocks(blocks)
          from, to = blocks.map(&:dup)
          @cubes << from.dup
          @cubes << to.dup
          return blocks if from == to

          diff = from.zip(to).map { |f, t| t - f }
          axis = diff.index { |e| !e.zero? }
          change = diff[axis].negative? ? -1 : 1

          add_blocks blocks, from, to, axis, change
        end

        def add_blocks(blocks, from, to, axis, change)
          loop do
            from[axis] += change
            break if from == to

            @cubes << from.dup
            blocks << from.dup
          end
          blocks
        end

        def settle_all
          @blocks = @blocks.sort_by { |block| block.map { |c| c[2] }.min }
          loop do
            puts "====="
            changes = false
            @blocks.each_with_index do |b, i|
              changed = settle b, i
              changes ||= changed
            end
            break unless changes
          end
        end

        def settle(block, index)
          block.each { |coords| @cubes.delete coords }

          loop do
            break if block.any? { |c| c[2] == 1 }

            new_block = block.dup.map { |coords| [coords[0], coords[1], coords[2] - 1] }
            break if clash? new_block

            block = new_block
          end

          block.each { |coords| @cubes << coords }

          return false if @blocks[index] == block

          puts "moved #{index}: #{block}"
          @blocks[index] = block
          true
        end

        def clash?(block)
          block.any? { |c| @cubes.include? c }
        end

        def try_disintegrate
          @blocks.count { |b| no_movement?(@blocks.reject { |ib| ib == b }) }
        end

        def no_movement?(blocks)
          blocks.each_with_index.none? { |b, i| settle2 blocks, b, i }
        end

        def settle2(blocks, block, index)

          loop do
            break if block.any? { |c| c[2] == 1 }

            new_block = block.dup.map { |coords| [coords[0], coords[1], coords[2] - 1] }
            break if clash2? blocks, new_block, index

            block = new_block
          end

          return false if blocks[index] == block

          true
        end

        def clash2?(blocks, block, index)
          blocks.reject.with_index { |_, i| i == index }.any? { |b| b.intersect? block }
        end
      end
    end
  end
end
