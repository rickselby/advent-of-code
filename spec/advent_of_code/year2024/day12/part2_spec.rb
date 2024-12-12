# frozen_string_literal: true

describe AdventOfCode::Year2024::Day12::Part2 do
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

      it { is_expected.to eq 80 }
    end

    context "with E data" do
      let(:data) do
        <<~DATA
          EEEEE
          EXXXX
          EEEEE
          EXXXX
          EEEEE
        DATA
      end

      it { is_expected.to eq 236 }
    end

    context "with awkward data" do
      let(:data) do
        <<~DATA
          AAAAAA
          AAABBA
          AAABBA
          ABBAAA
          ABBAAA
          AAAAAA
        DATA
      end

      it { is_expected.to eq 368 }
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

      it { is_expected.to eq 1206 }
    end
  end
end
