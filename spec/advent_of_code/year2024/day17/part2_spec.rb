# frozen_string_literal: true

describe AdventOfCode::Year2024::Day17::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        Register A: 2024
        Register B: 0
        Register C: 0

        Program: 0,3,5,4,3,0
      DATA
    end

    it { is_expected.to eq 117_440 }
  end
end
