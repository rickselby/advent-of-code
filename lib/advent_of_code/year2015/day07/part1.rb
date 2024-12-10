# frozen_string_literal: true

module AdventOfCode
  module Year2015
    module Day07
      # https://adventofcode.com/2015/day/7
      class Part1 < AdventOfCode::Part
        def result
          @wires = {}
          lines
          loop do
            parse @lines.shift
            break if @lines.empty?
          end
          @wires["a"]
        end

        private

        def parse(line)
          parts = line.split "->"
          target = parts[1].strip
          operation = parts[0].split
          case operation.size
          when 1 then op1 target, *operation, line
          when 2 then op2 target, *operation, line
          when 3 then op3 target, *operation, line
          end
        end

        def op1(target, argument, line)
          if get_arg(argument).nil?
            @lines << line
          else
            @wires[target] = get_arg(argument) unless @wires.key? target
          end
        end

        def op2(target, _, argument, line)
          if get_arg(argument).nil?
            @lines << line
          else
            @wires[target] = [~get_arg(argument)].pack("S").unpack1("S")
          end
        end

        def op3(target, arg1, operator, arg2, line)
          arg1 = get_arg(arg1)
          arg2 = get_arg(arg2)

          if arg1.nil? || arg2.nil?
            @lines << line
          else
            @wires[target] = do_op3 operator, arg1, arg2
          end
        end

        def do_op3(operator, arg1, arg2)
          case operator
          when "AND" then arg1 & arg2
          when "OR" then arg1 | arg2
          when "LSHIFT" then arg1 << arg2
          when "RSHIFT" then arg1 >> arg2
          end
        end

        def get_arg(arg)
          arg.match?(/\d+/) ? arg.to_i : @wires[arg]
        end
      end
    end
  end
end
