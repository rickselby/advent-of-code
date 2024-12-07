# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day03
      # https://adventofcode.com/2015/day/3
      class Part2 < Part1
        def initialize(input)
          super
          @santa = [0, 0]
          @robo_santa = [0, 0]
        end

        private

        def positions
          positions = Set.new([@santa])

          chars.each_with_index do |char, i|
            if i.even?
              @santa, positions = move_and_set @santa, char, positions
            else
              @robo_santa, positions = move_and_set @robo_santa, char, positions
            end
          end

          positions
        end

        def move_and_set(person, char, positions)
          person = move person, char
          positions << person
          [person, positions]
        end
      end
    end
  end
end
