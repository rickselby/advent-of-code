# frozen_string_literal: true

describe AdventOfCode::Y2023::Day8a do
  describe "result" do
    subject { described_class.new(lines).result }

    context "with one given example" do
      let(:lines) do
        <<~NODES
          RL

          AAA = (BBB, CCC)
          BBB = (DDD, EEE)
          CCC = (ZZZ, GGG)
          DDD = (DDD, DDD)
          EEE = (EEE, EEE)
          GGG = (GGG, GGG)
          ZZZ = (ZZZ, ZZZ)
        NODES
      end

      it { is_expected.to eq 2 }
    end

    context "with the other given example" do
      let(:lines) do
        <<~NODES
          LLR

          AAA = (BBB, BBB)
          BBB = (AAA, ZZZ)
          ZZZ = (ZZZ, ZZZ)
        NODES
      end

      it { is_expected.to eq 6 }
    end
  end
end
