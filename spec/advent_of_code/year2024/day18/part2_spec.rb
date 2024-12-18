# frozen_string_literal: true

describe AdventOfCode::Year2024::Day18::Part2 do
  describe "result" do
    subject { described_class.new(data, 6).result }

    let(:data) do
      <<~DATA
        5,4
        4,2
        4,5
        3,0
        2,1
        6,3
        2,4
        1,5
        0,6
        3,3
        2,6
        5,1
        1,2
        5,5
        2,5
        6,5
        1,4
        0,4
        6,4
        1,1
        6,1
        1,0
        0,5
        1,6
        2,0
      DATA
    end

    it { is_expected.to eq "6,1" }
  end
end
