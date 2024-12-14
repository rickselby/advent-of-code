# frozen_string_literal: true

module AdventOfCode
  module Helpers
    # Helper for handling the input as a map
    class Map
      attr_reader :map

      def initialize(input_array)
        @map = input_array
      end

      def dig(x, y)
        @map.dig(y, x)
      end

      def set(x, y, value)
        @map[y][x] = value
      end

      def width
        @map.first.length
      end

      def height
        @map.length
      end

      def transpose
        @map = @map.transpose
      end

      def rotate(direction = :ccw)
        case direction
        when :ccw
          @map.map!(&:reverse)
          transpose
        when :cw
          transpose
          @map.map!(&:reverse)
        end
      end

      def diagonals
        padding = [*0..(height - 1)].map { |i| nil_array * i }
        padded = padding.reverse.zip(@map).zip(padding).map(&:flatten)
        padded.transpose.map(&:compact)
      end

      def in_range?(x, y)
        !out_of_range? x, y
      end

      def out_of_range?(x, y)
        x.negative? || y.negative? || x >= width || y >= height
      end

      def find(value)
        @map.each_with_index do |row, y|
          x = row.index(value)
          return [x, y] unless x.nil?
        end

        nil
      end

      def rows
        @map
      end

      def cols
        transpose
      end

      def count(value)
        map.sum { |row| row.select { |c| c == value }.length }
      end

      private

      def nil_array
        @nil_array ||= [nil]
      end
    end
  end
end
