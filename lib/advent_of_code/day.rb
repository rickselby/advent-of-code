# frozen_string_literal: true

module AdventOfCode
  # Shared day functionality
  class Day
    def initialize(input)
      @input = input
    end

    def result
      raise "To implement"
    end

    protected

    def lines
      @lines ||= @input.lines
    end

    def input_array
      @input_array ||= lines.map { |l| l.strip.chars }
    end

    def single_line
      @single_line ||= lines.map(&:strip).join
    end
  end
end
