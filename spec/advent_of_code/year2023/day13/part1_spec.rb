# frozen_string_literal: true

describe AdventOfCode::Year2023::Day13::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        #.##..##.
        ..#.##.#.
        ##......#
        ##......#
        ..#.##.#.
        ..##..##.
        #.#.##.#.

        #...##..#
        #....#..#
        ..##..###
        #####.##.
        #####.##.
        ..##..###
        #....#..#
      DATA
    end

    it { is_expected.to eq 405 }
  end
end
