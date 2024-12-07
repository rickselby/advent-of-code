# frozen_string_literal: true

describe AdventOfCode::Year2015::Day01::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    data = [
      ["(())", 0],
      ["()()", 0],
      ["(((", 3],
      ["(()(()(", 3],
      ["))(((((", 3],
      ["())", -1],
      ["))(", -1],
      [")))", -3],
      [")())())", -3],
    ]

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
