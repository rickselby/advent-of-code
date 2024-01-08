# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day20
      # A flip flip module
      class FlipFlop < Module
        def receive(pulse, _)
          return if pulse == :high

          @status = !@status
          send_pulse @status ? :high : :low
        end

        def reset
          @status = false
        end
      end
    end
  end
end
