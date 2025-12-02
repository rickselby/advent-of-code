# frozen_string_literal: true

require "benchmark"
require "bundler/audit/task"
require "fileutils"
require "json"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir "lib"
loader.setup # ready!

Bundler::Audit::Task.new
RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new

desc "Run some code"
task :run, [:year, :day, :part] do |_, args|
  year = format "%4d", args[:year]
  day = format "%02d", args[:day]
  part = format "%1d", args[:part]

  input_file = Dir.glob "data/#{year}/#{day}.*"
  unless input_file.empty?
    input = File.read input_file.first
    input = case File.extname input_file.first
            when ".json"
              JSON.parse input, symbolize_names: true
            else
              input
            end
  end

  day = AdventOfCode.get(year, day, part).new(input)
  puts(Benchmark.measure { puts day.result })
end

desc "Create templates for a new solution"
task :create, [:year, :day, :part] do |_, args|
  year = format "%4d", args[:year]
  day = format "%02d", args[:day]
  part = format "%1d", args[:part]

  # Create a file for the data for the day
  data_dir = "data/#{year}"
  FileUtils.mkdir_p data_dir
  data_file = "#{data_dir}/#{day}.txt"
  FileUtils.touch data_file

  # Create a class for the part
  class_dir = "lib/advent_of_code/year#{year}/day#{day}"
  FileUtils.mkdir_p class_dir
  class_file = "#{class_dir}/part#{part}.rb"
  File.write class_file, format(CLASS_TEMPLATE, year:, day:, part:, url_day: args[:day])

  # Create a spec file for the part
  spec_dir = "spec/advent_of_code/year#{year}/day#{day}"
  FileUtils.mkdir_p spec_dir
  spec_file = "#{spec_dir}/part#{part}_spec.rb"
  File.write spec_file, format(SPEC_TEMPLATE, year:, day:, part:)

  # Add the files to git
  `git add #{class_file} #{spec_file}`
end

CLASS_TEMPLATE = <<~CODE_TEMPLATE
  # frozen_string_literal: true

  module AdventOfCode
    module Year%<year>s
      module Day%<day>s
        # https://adventofcode.com/%<year>s/day/%<url_day>s
        class Part%<part>s < AdventOfCode::Part
          def result
            # TODO: implement
          end
        end
      end
    end
  end
CODE_TEMPLATE

SPEC_TEMPLATE = <<~SPEC_TEMPLATE
  # frozen_string_literal: true

  describe AdventOfCode::Year%<year>s::Day%<day>s::Part%<part>s do
    describe "result" do
      subject { described_class.new(data).result }

      let(:data) do
        <<~DATA
          # data goes here
        DATA
      end

      it { is_expected.to eq :something }
    end
  end
SPEC_TEMPLATE
