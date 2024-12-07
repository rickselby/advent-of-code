# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day06
      # https://adventofcode.com/2023/day/6
      class Part1 < AdventOfCode::Part
        def initialize(input)
          super([])
          parse_input input
        end

        def result
          @input.map { |r| ways_to_beat r }.reduce(:*)
        end

        private

        def parse_input(input)
          times = get_values input.lines[0]
          distances = get_values input.lines[1]
          times.each_with_index do |time, index|
            @input << { time:, distance: distances[index] }
          end
        end

        def get_values(line)
          line.split(":")[1].strip.split.map(&:to_i)
        end

        def ways_to_beat(race)
          (0..race[:time]).count { |time_held| beats?(time_held, race) }
        end

        def beats?(time_held, race)
          distance_travelled(time_held, race) > race[:distance]
        end

        def distance_travelled(time_held, race)
          (race[:time] - time_held) * time_held
        end
      end
    end
  end
end
