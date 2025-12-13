# frozen_string_literal: true

describe AdventOfCode::Year2025::Day09::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        7,1
        11,1
        11,7
        9,7
        9,5
        2,5
        2,3
        7,3
      DATA
    end

    it { is_expected.to eq 50 }
  end
end
