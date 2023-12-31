# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day02
      # A single line of the input, broken down
      class Line
        MAX = {
          red:   12,
          green: 13,
          blue:  14,
        }.freeze

        attr_reader :game_id

        def initialize(line)
          init_colours
          matches = line.match(/Game (?<game_id>\d+):/)
          @game_id = matches[:game_id].to_i
          parse_game line.delete_prefix matches[0]
        end

        def valid?
          MAX.keys.all? { |k| @colours[k] <= MAX[k] }
        end

        def power
          @colours.values.reduce :*
        end

        private

        def init_colours
          @colours = MAX.keys.to_h { |k| [k, 0] }
        end

        def parse_game(game)
          game.split(";").each { |set| parse_set set }
        end

        def parse_set(set)
          set.split(",").each { |cubes| parse_cubes cubes }
        end

        def parse_cubes(cubes)
          matches = cubes.match(/(?<count>\d+)\s*(?<colour>[a-z]+)/)
          colour_key = matches[:colour].to_sym
          @colours[colour_key] = [@colours[colour_key], matches[:count].to_i].max
        end
      end
    end
  end
end
