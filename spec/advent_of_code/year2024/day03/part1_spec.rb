# frozen_string_literal: true

describe AdventOfCode::Year2024::Day03::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
      DATA
    end

    it { is_expected.to eq 161 }
  end
end
