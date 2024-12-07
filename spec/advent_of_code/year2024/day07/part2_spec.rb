# frozen_string_literal: true

describe AdventOfCode::Year2024::Day07::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        190: 10 19
        3267: 81 40 27
        83: 17 5
        156: 15 6
        7290: 6 8 6 15
        161011: 16 10 13
        192: 17 8 14
        21037: 9 7 18 13
        292: 11 6 16 20
      DATA
    end

    it { is_expected.to eq 11_387 }
  end
end
