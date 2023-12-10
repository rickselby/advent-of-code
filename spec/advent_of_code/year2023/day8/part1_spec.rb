# frozen_string_literal: true

describe AdventOfCode::Year2023::Day8::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with one given example" do
      let(:data) do
        <<~DATA
          RL

          AAA = (BBB, CCC)
          BBB = (DDD, EEE)
          CCC = (ZZZ, GGG)
          DDD = (DDD, DDD)
          EEE = (EEE, EEE)
          GGG = (GGG, GGG)
          ZZZ = (ZZZ, ZZZ)
        DATA
      end

      it { is_expected.to eq 2 }
    end

    context "with the other given example" do
      let(:data) do
        <<~DATA
          LLR

          AAA = (BBB, BBB)
          BBB = (AAA, ZZZ)
          ZZZ = (ZZZ, ZZZ)
        DATA
      end

      it { is_expected.to eq 6 }
    end
  end
end
