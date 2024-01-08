# frozen_string_literal: true

describe AdventOfCode::Year2023::Day09::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        0 3 6 9 12 15
        1 3 6 10 15 21
        10 13 16 21 30 45
      DATA
    end

    it { is_expected.to eq 2 }
  end

  describe "prev_diff" do
    subject { described_class.new(nil).prev_diff(line) }

    data = [
      [[0, 3, 6, 9, 12, 15], -3],
      [[1, 3, 6, 10, 15, 21], 0],
      [[10, 13, 16, 21, 30, 45], 5],
    ]

    data.each do |sequence, result|
      context "with sequence #{sequence}" do
        let(:line) { sequence }

        it { is_expected.to eq result }
      end
    end
  end
end
