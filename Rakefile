# frozen_string_literal: true

require "fileutils"
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

desc "Create templates for a new solution"
task :create, [:year, :day, :part] do |_, args|
  # Create a file for the data for the day
  data_dir = "data/#{args[:year]}"
  FileUtils.mkdir_p data_dir
  data_file = "#{data_dir}/#{args[:day]}.txt"
  FileUtils.touch data_file
  # Create a class for the part
  class_dir = "lib/advent_of_code/year#{args[:year]}/day#{args[:day]}"
  FileUtils.mkdir_p class_dir
  class_file = "#{class_dir}/part#{args[:part]}.rb"
  File.write class_file, format(CLASS_TEMPLATE, args)
  # Create a spec file for the part
  spec_dir = "spec/advent_of_code/year#{args[:year]}/day#{args[:day]}"
  FileUtils.mkdir_p spec_dir
  spec_file = "#{spec_dir}/part#{args[:part]}_spec.rb"
  File.write spec_file, format(SPEC_TEMPLATE, args)
  `git add #{data_file} #{class_file} #{spec_file}`
end

CLASS_TEMPLATE = <<~CODE_TEMPLATE
  # frozen_string_literal: true

  class AdventOfCode
    module Year%<year>s
      module Day%<day>s
        # https://adventofcode.com/%<year>s/day/%<day>s
        class Part%<part>s < AdventOfCode::Day
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
