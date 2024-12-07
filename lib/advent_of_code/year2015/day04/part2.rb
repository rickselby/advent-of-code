# frozen_string_literal: true

require "digest/md5"

module AdventOfCode
  module Year2015
    module Day04
      # https://adventofcode.com/2015/day/4
      class Part2 < Part1
        private

        def prefix
          @prefix ||= "000000"
        end
      end
    end
  end
end
