# frozen_string_literal: true

describe AdventOfCode::Year2025::Day01::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
      DATA
    end

    it { is_expected.to eq 3 }
  end
end
