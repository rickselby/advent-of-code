# frozen_string_literal: true

describe AdventOfCode::Year2023::Day15::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
      DATA
    end

    it { is_expected.to eq 145 }
  end
end
