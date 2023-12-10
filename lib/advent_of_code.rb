# frozen_string_literal: true

# Base class to load any year / day / part combo
class AdventOfCode
  def self.get(year, day, part)
    const_get("Year#{year}").const_get("Day#{day}").const_get("Part#{part}")
  end
end
