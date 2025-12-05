# frozen_string_literal: true

describe AdventOfCode::Year2025::Day05::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
      DATA
    end

    it { is_expected.to eq 3 }
  end
end
