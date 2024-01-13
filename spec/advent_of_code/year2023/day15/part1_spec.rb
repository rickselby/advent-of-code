# frozen_string_literal: true

describe AdventOfCode::Year2023::Day15::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
      DATA
    end

    it { is_expected.to eq 1320 }
  end

  describe "hash" do
    subject { described_class.new(nil).hash(data) }

    data = [
      ["rn=1", 30],
      ["cm-", 253],
      ["qp=3", 97],
      ["cm=2", 47],
      ["qp-", 14],
      ["pc=4", 180],
      ["ot=9", 9],
      ["ab=5", 197],
      ["pc-", 48],
      ["pc=6", 214],
      ["ot=7", 231],
    ]

    data.each do |string, result|
      context "with the string #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
