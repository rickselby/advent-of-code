# frozen_string_literal: true

describe AdventOfCode::Year2023::Day17::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the first example" do
      let(:data) do
        <<~DATA
          2413432311323
          3215453535623
          3255245654254
          3446585845452
          4546657867536
          1438598798454
          4457876987766
          3637877979653
          4654967986887
          4564679986453
          1224686865563
          2546548887735
          4322674655533
        DATA
      end

      it { is_expected.to eq 94 }
    end

    context "with the second example" do
      let(:data) do
        <<~DATA
          111111111111
          999999999991
          999999999991
          999999999991
          999999999991
        DATA
      end

      it { is_expected.to eq 71 }
    end
  end
end
