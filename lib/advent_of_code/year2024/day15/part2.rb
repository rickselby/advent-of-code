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

          return false if targets.any? { |t| @map[t[1]][t[0]] == "#" }

          # get more coords to check if necessary

          if %w[^ v].include?(instruction)
            targets.each do |c|
              case @map[c[1]][c[0]]
              when "[" then targets << next_coords(c, ">")
              when "]" then targets << next_coords(c, "<")
              end
              targets.uniq!
            end
          end

          need_to_check = targets.reject { |t| @map[t[1]][t[0]] == "." }

          unless need_to_check.empty?
            return false unless try_move(need_to_check, instruction, nested: true)
          end

          coords.each do |c|
            target = next_coords c, instruction
            update_map c, target, !nested
          end

          if coords.length != targets.length
            missing = targets - coords.map { |c| next_coords c, instruction }
            missing.each { |c| @map[c[1]][c[0]] = "." }
          end

          true
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
