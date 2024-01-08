# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day20
      # Abstract class for a single module
      class Module
        attr_reader :inputs, :name, :targets

        def initialize(name, targets, modules)
          @name = name
          @targets = targets
          @modules = modules
          @inputs = []
          reset
        end

        def add_input(name)
          @inputs << name
        end

        # Default function is to pass the pulse through
        def receive(pulse, _name)
          send_pulse pulse
        end

        def reset
          # To implement
        end

        protected

        def send_pulse(pulse)
          @targets.each { |target_name| @modules.pulse @name, target_name, pulse }
        end
      end
    end
  end
end
