# frozen_string_literal: true

describe AdventOfCode::Y2023::Day8b do
  describe "result" do
    subject { described_class.new(lines).result }

    context "with one given example" do
      let(:lines) do
        <<~NODES
          LR

          11A = (11B, XXX)
          11B = (XXX, 11Z)
          11Z = (11B, XXX)
          22A = (22B, XXX)
          22B = (22C, 22C)
          22C = (22Z, 22Z)
          22Z = (22B, 22B)
          XXX = (XXX, XXX)
        NODES
      end

      it { is_expected.to eq 6 }
    end
  end
end
