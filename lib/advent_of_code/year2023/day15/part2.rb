# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day15
      # https://adventofcode.com/2023/day/15
      class Part2 < Part1
        def result
          @hashmap = {}
          steps.each { |s| step s }
          @hashmap.sum { |box_index, box| sum box, box_index }
        end

        private

        def step(string)
          label = string[/(\w+)/]
          box_number = hash label
          @hashmap[box_number] ||= {}
          if string.include? "-"
            @hashmap[box_number].delete label
          elsif string.include? "="
            @hashmap[box_number][label] = string[/(\d)/].to_i
          end
        end

        def sum(box, box_index)
          box_index += 1
          box.values.each_with_index.sum do |lens, index|
            box_index * (index + 1) * lens
          end
        end
      end
    end
  end
end
