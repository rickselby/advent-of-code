# frozen_string_literal: true

module AdventOfCode
  module Year2024
    module Day15
      # https://adventofcode.com/2024/day/15
      class Part1 < AdventOfCode::Part
        def result
          map, instructions = input_parts
          @map = build_map(map)
          move instructions
          gps
        end

        private

        def build_map(map)
          map.reject(&:empty?).map(&:chars)
        end

        def input_parts
          lines.slice_when { |l, _| l == "" }.map(&:to_a)
        end

        def move(instructions)
          instructions.join.chars.each { try_move? start, it }
        end

        def try_move?(coords, instruction, nested: false)
          target = next_coords coords, instruction
          case @map[target[1]][target[0]]
          when "." then nil # continue to making the move
          when "#" then return false
          else # @, O
            return false unless try_move? target, instruction, nested: true
          end

          update_map coords, target, !nested
          true
        end

        def update_map(coords, target, clear)
          @map[target[1]][target[0]] = @map[coords[1]][coords[0]]
          @map[coords[1]][coords[0]] = "." if clear
        end

        def start
          @map.each_with_index do |row, y|
            x = row.index("@")
            return [x, y] unless x.nil?
          end

          raise "couldn't find start point"
        end

        def next_coords(coords, instruction)
          case instruction
          when "^" then [coords[0], coords[1] - 1]
          when ">" then [coords[0] + 1, coords[1]]
          when "<" then [coords[0] - 1, coords[1]]
          when "v" then [coords[0], coords[1] + 1]
          end
        end

        def gps
          val = 0
          @map.each_with_index do |row, y|
            row.each_with_index do |cell, x|
              next unless cell == "O"

              val += (y * 100) + x
            end
          end
          val
        end
      end
    end
  end
end
