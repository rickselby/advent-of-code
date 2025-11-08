# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day20
      # A collection of modules, and a way of counting pulses between them
      class Modules
        attr_reader :button_presses, :modules

        def initialize(lines)
          @modules = {}
          create_modules lines
          reset
        end

        def press_button
          pulse :button, :broadcaster, :low
          parse_pulses
        end

        def press_button_until_target_outputs_high(target)
          reset
          @halt_on = target
          @halted = false
          @button_presses = 0
          loop do
            break if @halted

            press_button
            @button_presses += 1
          end
          @button_presses
        end

        def pulse(sender, target, pulse)
          @pulse_count[pulse] += 1
          @pulses << [sender, target, pulse]
        end

        def result
          @pulse_count.values.reduce :*
        end

        private

        def create_modules(lines)
          lines.map(&:strip).each do |line|
            name, targets = line.split " -> "
            targets = targets.split(",").map { it.strip.to_sym }
            create_module name, targets
          end
          set_inputs
        end

        def set_inputs
          @modules.each_value do |mod|
            mod.targets.each do |target|
              next unless @modules.key? target

              @modules[target].add_input mod.name
            end
          end
        end

        def create_module(name, targets)
          klass = case name[0]
                  when "%" then FlipFlop
                  when "&" then Conjunction
                  else Module
                  end
          name = name[1..] unless klass == Module
          name = name.to_sym
          @modules[name] = klass.new name, targets, self
        end

        def parse_pulses
          loop do
            return if @pulses.empty?

            sender, target, pulse = @pulses.shift
            next unless @modules.key? target

            if sender == @halt_on && pulse == :high
              @halted = true
              return
            end

            @modules[target].receive pulse, sender
          end
        end

        def reset
          @modules.each_value(&:reset)
          @pulse_count = { high: 0, low: 0 }
          @pulses = []
          @halt_on = nil
        end
      end
    end
  end
end
