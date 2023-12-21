# frozen_string_literal: true

describe AdventOfCode::Year2023::Day21::Part1 do
  describe "result" do
    subject { described_class.new(data).steps(6) }

    let(:data) do
      <<~DATA
        ...........
        .....###.#.
        .###.##..#.
        ..#.#...#..
        ....#.#....
        .##..S####.
        .##..#...#.
        .......##..
        .##.#.####.
        .##..##.##.
        ...........
      DATA
    end

    it { is_expected.to eq 16 }
  end
end
