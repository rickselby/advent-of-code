# frozen_string_literal: true

describe AdventOfCode::Year2024::Day01::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
      DATA
    end

    it { is_expected.to eq 11 }
  end
end
