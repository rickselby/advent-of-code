# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day20
      # The broadcaster
      class Broadcaster < Module
        def receive(pulse, _)
          send_pulse pulse
        end
      end
    end
  end
end
