# frozen_string_literal: true

module AdventOfCode
  # Shared part functionality
  class Part
    def initialize(input)
      @input = input
    end

    def result
      raise "To implement"
    end

    protected

    def lines
      @lines ||= @input.lines.map(&:strip)
    end

    def input_array
      @input_array ||= lines.map(&:chars)
    end

    def single_line
      @single_line ||= lines.join
    end
  end
end
