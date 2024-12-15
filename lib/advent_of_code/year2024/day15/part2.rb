# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day15
      # https://adventofcode.com/2024/day/15
      class Part2 < Part1
        private

        def move(instructions)
          instructions.join.chars.each { |instruction| try_move [start], instruction }
        end

        def build_map(map)
          super.map { |line| line.map { |char| widen_map(char) }.flatten }
        end

        def widen_map(char)
          case char
          when "O" then %w([ ])
          when "@" then [char, "."]
          else [char, char]
          end
        end

        def try_move(coords, instruction, nested: false)
          targets = coords.map { |c| next_coords c, instruction }

          return false if cannot_move targets

          # get more coords to check if necessary (only when moving up or down)
          targets = add_more_targets targets, instruction

          # some columns might be ok to move, some might now...
          need_to_check = targets.reject { |t| can_move t }

          return false unless need_to_check.empty? || try_move(need_to_check, instruction, nested: true)

          do_updates coords, targets, instruction, nested

          true
        end

        def cannot_move(targets)
          targets.any? { |t| @map[t[1]][t[0]] == "#" }
        end

        def can_move(target)
          @map[target[1]][target[0]] == "."
        end

        def add_more_targets(targets, instruction)
          return targets unless %w[^ v].include?(instruction)

          targets.each do |c|
            case @map[c[1]][c[0]]
            when "[" then targets << next_coords(c, ">")
            when "]" then targets << next_coords(c, "<")
            end
            targets.uniq!
          end
          targets
        end

        def do_updates(coords, targets, instruction, nested)
          coords.each { |c| update_map c, next_coords(c, instruction), !nested }

          # clear any columns that have finished moving
          return unless coords.length != targets.length

          (targets - coords.map { |c| next_coords c, instruction }).each { |c| @map[c[1]][c[0]] = "." }
        end

        def possible_move?(coords)
          target = next_coords coords, instruction
          @map[target[1]][target[0]] != "#"
        end

        def gps
          val = 0
          @map.each_with_index do |row, y|
            row.each_with_index do |cell, x|
              next unless cell == "["

              val += (y * 100) + x
            end
          end
          val
        end
      end
    end
  end
end
