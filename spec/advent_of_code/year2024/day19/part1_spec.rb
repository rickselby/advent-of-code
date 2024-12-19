# frozen_string_literal: true

describe AdventOfCode::Year2024::Day19::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        r, wr, b, g, bwu, rb, gb, br

        brwrr
        bggr
        gbbr
        rrbgbr
        ubwu
        bwurrg
        brgr
        bbrgwb
      DATA
    end

    it { is_expected.to eq 6 }
  end
end
