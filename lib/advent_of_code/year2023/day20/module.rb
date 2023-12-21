# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day20
      # Abstract class for a single module
      class Module
        attr_reader :name, :targets

        def initialize(name, targets, modules)
          @name = name
          @targets = targets
          @modules = modules
          @inputs = []
        end

        def add_input(name)
          @inputs << name
        end

        # Default function is to pass the pulse through
        def receive(pulse, _name)
          send_pulse pulse
        end

        protected

        def send_pulse(pulse)
          @targets.each { |target_name| @modules.pulse @name, target_name, pulse }
        end
      end
    end
  end
end
