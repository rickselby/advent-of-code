# frozen_string_literal: true

class AdventOfCode
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
  end
end
