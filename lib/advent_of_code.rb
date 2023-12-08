class AdventOfCode
  def self.get(year, day, part)
    self.const_get("Y#{year}").const_get("Day#{day}#{part}")
  end
end
