# frozen_string_literal: true

describe AdventOfCode::Year2015::Day02::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        2x3x4
        1x1x10
      DATA
    end

    it { is_expected.to eq 34 + 14 }
  end
end