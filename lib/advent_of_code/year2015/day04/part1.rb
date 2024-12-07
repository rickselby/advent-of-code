# frozen_string_literal: true

require "digest/md5"

module AdventOfCode
  module Year2015
    module Day04
      # https://adventofcode.com/2015/day/4
      class Part1 < AdventOfCode::Part
        def result
          i = 0
          loop do
            break if Digest::MD5.hexdigest("#{single_line}#{i}").start_with?(prefix)

            i += 1
          end
          i
        end

        private

        def prefix
          @prefix ||= "00000"
        end
      end
    end
  end
end
