# frozen_string_literal: true

require "matrix"

class AdventOfCode
  module Algorithms
    # Implementation of the shoelace algorithm for calculating areas of polygons from their
    # https://www.themathdoctors.org/polygon-coordinates-and-areas/
    class Shoelace
      def initialize(coordinates)
        @coordinates = coordinates
        # Add the first coordinate to the end of the list to make the calculations work!
        @coordinates << coordinates.first
      end

      def perimeter
        @perimeter ||= vectors.each_with_index.sum do |vector, index|
          next 0 if index == vectors.size - 1

          (vector - vectors[index + 1]).magnitude
        end
      end

      def result
        shoelace
      end

      def with_border
        shoelace + (perimeter / 2) + 1
      end

      private

      def vectors
        @vectors ||= @coordinates.map { |c| Vector.elements c }
      end

      def shoelace
        s1 = 0
        s2 = 0

        @coordinates.each_with_index do |coords, index|
          next if index == @coordinates.size - 1

          next_coords = @coordinates[index + 1]
          s1 += coords[0] * next_coords[1]
          s2 += coords[1] * next_coords[0]
        end

        (s1 - s2).abs * 0.5
      end
    end
  end
end
