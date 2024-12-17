# frozen_string_literal: true

describe AdventOfCode::Year2024::Day17::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        Register A: 729
        Register B: 0
        Register C: 0

        Program: 0,1,5,4,3,0
      DATA
    end

    it { is_expected.to eq "4,6,3,5,6,3,5,2,1,0" }
  end
end
