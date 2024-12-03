# frozen_string_literal: true

describe AdventOfCode::Year2024::Day02::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
      DATA
    end

    it { is_expected.to eq 2 }
  end
end
