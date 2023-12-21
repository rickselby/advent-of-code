# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day20
      # A flip flip module
      class FlipFlop < Module
        def initialize(name, targets, modules)
          super
          @status = false
        end

        def receive(pulse, _)
          return if pulse == :high

          @status = !@status
          send_pulse @status ? :high : :low
        end
      end
    end
  end
end
