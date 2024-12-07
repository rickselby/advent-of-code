# frozen_string_literal: true

describe AdventOfCode::Year2015::Day03::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    data = [
      [">", 2],
      ["^>v<", 4],
      ["^v^v^v^v^v", 2],
    ]

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
