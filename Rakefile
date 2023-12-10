# frozen_string_literal: true

require "json"
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
  input_file = Dir.glob "data/#{args[:year]}/#{args[:day]}.*"
  unless input_file.empty?
    input = File.read input_file.first
    input = case File.extname input_file.first
            when ".json"
              JSON.parse input, symbolize_names: true
            else
              input
            end
  end

  day = AdventOfCode.get(args[:year], args[:day], args[:part]).new(input)
  puts day.result
end
