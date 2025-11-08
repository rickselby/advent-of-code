# frozen_string_literal: true

module AdventOfCode
  module Year2023
    module Day12
      # Each line in the puzzle can be handled separately
      class Line
        def initialize(line)
          springs, groups = line.split
          @springs = springs.tr(".", " ").squeeze(" ").strip
          @groups = groups.split(",").map(&:to_i)
          @state_cache = {}
        end

        def possibilities
          count
        end

        private

        def count(s_idx = 0, g_idx = 0, g_len = 0)
          cache_key = state_key s_idx, g_idx, g_len

          # Get cached result if possible
          return @state_cache[cache_key] if @state_cache.key? cache_key

          # At the end of the line - Check if this iteration was a match
          return match g_idx, g_len if s_idx == @springs.size

          # Get the result for this position (and cache it!)
          result(s_idx, g_idx, g_len).tap { @state_cache[cache_key] = it }
        end

        def match(g_idx, g_len)
          if g_idx == @groups.size - 1 && g_len == @groups[g_idx]
            g_idx += 1
            g_len = 0
          end

          (g_idx == @groups.size && g_len.zero?) ? 1 : 0
        end

        def result(s_idx, g_idx, g_len)
          result = 0

          result += count s_idx + 1, g_idx, g_len + 1 if continue_group? s_idx, g_idx, g_len

          if [" ", "?"].include? @springs[s_idx]
            if not_tracking_group? g_len
              result += count s_idx + 1, g_idx, 0
            elsif end_of_group? g_idx, g_len
              result += count s_idx + 1, g_idx + 1, 0
            end
          end

          result
        end

        # Continue a group if the symbol is correct and we're not at the group length yet
        def continue_group?(s_idx, g_idx, g_len)
          %w[# ?].include?(@springs[s_idx]) && @groups[g_idx] && g_len < @groups[g_idx]
        end

        def end_of_group?(g_idx, g_len)
          @groups[g_idx] && g_len == @groups[g_idx]
        end

        def not_tracking_group?(g_len)
          g_len.zero?
        end

        def state_key(s_idx, g_idx, g_len)
          [s_idx, g_idx, g_len].join ":"
        end
      end
    end
  end
end
