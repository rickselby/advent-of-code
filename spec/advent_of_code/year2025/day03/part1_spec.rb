# frozen_string_literal: true

describe AdventOfCode::Year2025::Day03::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        987654321111111
        811111111111119
        234234234234278
        818181911112111
      DATA
    end

    it { is_expected.to eq 357 }
  end
end
