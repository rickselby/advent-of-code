# frozen_string_literal: true

describe AdventOfCode::Y2023::Day6a do
  describe "result" do
    subject { described_class.new(lines).result }

    let(:lines) do
      <<~RACES
        Time:      7  15   30
        Distance:  9  40  200
      RACES
    end

    it { is_expected.to eq 288 }
  end
end
