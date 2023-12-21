# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day20
      # A conjunction module
      class Conjunction < Module
        def add_input(name)
          super
          @status[name] = :low
        end

        def receive(pulse, name)
          @status[name] = pulse

          send_pulse @status.values.all?(:high) ? :low : :high
        end

        def reset
          @status ||= {}
          @status.each_key { |k| @status[k] = :low }
        end
      end
    end
  end
end
