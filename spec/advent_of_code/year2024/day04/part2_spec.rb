# frozen_string_literal: true

describe AdventOfCode::Year2024::Day04::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with given data" do
      let(:data) do
        <<~DATA
          MMMSXXMASM
          MSAMXMSMSA
          AMXSXMAAMM
          MSAMASMSMX
          XMASAMXAMM
          XXAMMXXAMA
          SMSMSASXSS
          SAXAMASAAA
          MAMMMXMMMM
          MXMXAXMASX
        DATA
      end

      it { is_expected.to eq 9 }
    end

    context "with nasty example" do
      let(:data) do
        <<~DATA
          MMSS
          MAAM
          SMMS
        DATA
      end

      it { is_expected.to eq 1 }
    end
  end
end
