# frozen_string_literal: true

describe AdventOfCode::Year2015::Day03::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    data = [
      ["^v", 3],
      ["^>v<", 3],
      ["^v^v^v^v^v", 11],
    ]

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
