# frozen_string_literal: true

require "rspec/core/rake_task"
require "rubocop/rake_task"
require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir "lib"
loader.setup # ready!

RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new

desc "Run some code"
task :run, [:year, :day, :part] do |_, args|
  input_path = "data/#{args[:year]}/#{args[:day]}.txt"
  input = File.read input_path if File.exist? input_path
  day = AdventOfCode.get(args[:year], args[:day], args[:part]).new(input)
  puts day.result
end
