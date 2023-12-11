# frozen_string_literal: true

describe AdventOfCode::Year2023::Day11::Part2 do
  describe "result" do
    subject { described_class.new(data, factor).result }

    let(:data) do
      <<~DATA
        ...#......
        .......#..
        #.........
        ..........
        ......#...
        .#........
        .........#
        ..........
        .......#..
        #...#.....
      DATA
    end

    context "with a factor of 10" do
      let(:factor) { 10 }

      it { is_expected.to eq 1030 }
    end

    context "with a factor of 100" do
      let(:factor) { 100 }

      it { is_expected.to eq 8410 }
    end
  end
end
