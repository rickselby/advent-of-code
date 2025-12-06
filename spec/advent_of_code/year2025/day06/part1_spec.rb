# frozen_string_literal: true

describe AdventOfCode::Year2025::Day06::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        123 328  51 64
         45 64  387 23
          6 98  215 314
        *   +   *   +
      DATA
    end

    it { is_expected.to eq 4_277_556 }
  end
end
