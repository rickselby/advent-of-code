# frozen_string_literal: true

module AdventOfCode
  module Helpers
    # Helper for representing
    class Coordinates
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end

      def coordinates
        [x, y]
      end

      def move(direction)
        case direction
        when :left, :west then @x -= 1
        when :right, :east then @x += 1
        when :up, :north then @y -= 1
        when :down, :south then @y += 1
        when /_/ then direction.to_s.split("_").each { |d| move d.to_sym }
        end

        self
      end

      def adjacent
        %i[north east south west].map { |d| dup.move d }
      end

      def ==(other)
        coordinates == other.coordinates
      end
    end
  end
end
