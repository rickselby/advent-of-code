# frozen_string_literal: true

# Base class to load any year / day / part combo
class AdventOfCode
  def self.get(year, day, part = nil)
    const_get("Y#{year}").const_get("Day#{day}#{part}")
  end
end
