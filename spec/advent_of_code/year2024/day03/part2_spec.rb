# frozen_string_literal: true

describe AdventOfCode::Year2024::Day03::Part2 do
  describe "result" do
    subject { described_class.new(str).result }

    key_with_break = <<~DATA
      don't()mul(802,728)
      do()c
    DATA

    data = {
      "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"                  => 48,
      "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))don't()mul(10,10)" => 48,
      key_with_break                                                                               => 0,
    }

    data.each do |str, result|
      context "with the input #{str}" do
        let(:str) { str }

        it { is_expected.to eq result }
      end
    end
  end
end
