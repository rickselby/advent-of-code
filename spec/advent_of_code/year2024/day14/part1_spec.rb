# frozen_string_literal: true

describe AdventOfCode::Year2024::Day14::Part1 do
  describe "result" do
    subject { described_class.new(data, 11, 7).result }

    let(:data) do
      <<~DATA
        p=0,4 v=3,-3
        p=6,3 v=-1,-3
        p=10,3 v=-1,2
        p=2,0 v=2,-1
        p=0,0 v=1,3
        p=3,0 v=-2,-2
        p=7,6 v=-1,-3
        p=3,0 v=-1,-2
        p=9,3 v=2,3
        p=7,3 v=-1,2
        p=2,4 v=2,-3
        p=9,5 v=-3,-3
      DATA
    end

    it { is_expected.to eq 12 }
  end
end
