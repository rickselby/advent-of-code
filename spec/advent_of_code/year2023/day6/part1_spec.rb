# frozen_string_literal: true

describe AdventOfCode::Year2023::Day6::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        Time:      7  15   30
        Distance:  9  40  200
      DATA
    end

    it { is_expected.to eq 288 }
  end
end
