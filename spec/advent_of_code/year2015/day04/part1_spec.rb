# frozen_string_literal: true

describe AdventOfCode::Year2015::Day04::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    data = [
      ["abcdef", 609_043],
      ["pqrstuv", 1_048_970],
    ]

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
