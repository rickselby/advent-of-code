# frozen_string_literal: true

describe AdventOfCode::Year2024::Day12::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with small data" do
      let(:data) do
        <<~DATA
          AAAA
          BBCD
          BBCC
          EEEC
        DATA
      end

      it { is_expected.to eq 140 }
    end

    context "with awkward data" do
      let(:data) do
        <<~DATA
          OOOOO
          OXOXO
          OOOOO
          OXOXO
          OOOOO
        DATA
      end

      it { is_expected.to eq 772 }
    end

    context "with big data" do
      let(:data) do
        <<~DATA
          RRRRIICCFF
          RRRRIICCCF
          VVRRRCCFFF
          VVRCCCJFFF
          VVVVCJJCFE
          VVIVCCJJEE
          VVIIICJJEE
          MIIIIIJJEE
          MIIISIJEEE
          MMMISSJEEE
        DATA
      end

      it { is_expected.to eq 1930 }
    end
  end
end
