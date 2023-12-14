# frozen_string_literal: true

describe AdventOfCode::Year2023::Day14::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        O....#....
        O.OO#....#
        .....##...
        OO.#O....O
        .O.....O#.
        O.#..O.#.#
        ..O..#O..O
        .......O..
        #....###..
        #OO..#....
      DATA
    end

    it { is_expected.to eq 136 }
  end
end
