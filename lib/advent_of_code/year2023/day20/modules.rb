# frozen_string_literal: true

class AdventOfCode
  module Year2023
    module Day20
      # A collection of modules, and a way of counting pulses between them
      class Modules
        def initialize(lines)
          @modules = {}
          @broadcast = []
          create_modules lines
          @pulse_count = { high: 0, low: 0 }
          @pulses = []
        end

        def press_button
          pulse :button, :broadcaster, :low
          parse_pulses
        end

        def pulse(sender, target, pulse)
          @pulse_count[pulse] += 1
          @pulses << [sender, target, pulse]
        end

        def result
          p @pulse_count
          @pulse_count.values.reduce :*
        end

        private

        def create_modules(lines)
          lines.map(&:strip).each do |line|
            name, targets = line.split " -> "
            targets = targets.split(",").map { |t| t.strip.to_sym }
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

            @modules[target].receive pulse, sender
          end
        end
      end
    end
  end
end
