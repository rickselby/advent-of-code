# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day22
      # https://adventofcode.com/2023/day/22
      class Part1 < AdventOfCode::Part
        def result
          @blocks = []
          @cubes = Set.new
          parse_input
          settle_all
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
          block = drop_block block
          block.each { |coords| @cubes << coords }

          return false if @blocks[index] == block

          @blocks[index] = block
          true
        end

        def drop_block(block)
          loop do
            break if block.any? { |c| c[2] == 1 }

            new_block = shift_block_down block
            break if clash? new_block

            block = new_block
          end

          block
        end

        def clash?(block)
          block.any? { |c| @cubes.include? c }
        end

        def try_disintegrate
          @blocks.count do |block|
            without_coords(block) { no_movement?(@blocks.reject { |b| b == block }) }
          end
        end

        def no_movement?(blocks)
          blocks.each.none? do |block|
            without_coords(block) { can_block_move? block }
          end
        end

        def can_block_move?(block)
          return false if block.any? { |c| c[2] == 1 }

          !clash?(shift_block_down(block))
        end

        def shift_block_down(block)
          block.dup.map { |coords| [coords[0], coords[1], coords[2] - 1] }
        end

        def without_coords(block)
          block.each { |coords| @cubes.delete coords }
          result = yield
          block.each { |coords| @cubes << coords }
          result
        end
      end
    end
  end
end
