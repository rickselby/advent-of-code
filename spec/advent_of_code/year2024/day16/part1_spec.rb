# frozen_string_literal: true

describe AdventOfCode::Year2024::Day16::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with one example" do
      let(:data) do
        <<~DATA
          ###############
          #.......#....E#
          #.#.###.#.###.#
          #.....#.#...#.#
          #.###.#####.#.#
          #.#.#.......#.#
          #.#.#####.###.#
          #...........#.#
          ###.#.#####.#.#
          #...#.....#.#.#
          #.#.#.###.#.#.#
          #.....#...#.#.#
          #.###.#.#.#.#.#
          #S..#.....#...#
          ###############
        DATA
      end

      it { is_expected.to eq 7036 }
    end

    context "with a larger example" do
      let(:data) do
        <<~DATA
          #################
          #...#...#...#..E#
          #.#.#.#.#.#.#.#.#
          #.#.#.#...#...#.#
          #.#.#.#.###.#.#.#
          #...#.#.#.....#.#
          #.#.#.#.#.#####.#
          #.#...#.#.#.....#
          #.#.#####.#.###.#
          #.#.#.......#...#
          #.#.###.#####.###
          #.#.#...#.....#.#
          #.#.#.#####.###.#
          #.#.#.........#.#
          #.#.#.#########.#
          #S#.............#
          #################
        DATA
      end

      it { is_expected.to eq 11_048 }
    end
  end
end
