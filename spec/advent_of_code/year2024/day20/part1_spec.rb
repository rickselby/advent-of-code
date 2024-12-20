# frozen_string_literal: true

describe AdventOfCode::Year2024::Day20::Part1 do
  describe "result" do
    subject { described_class.new(data, 20).result }

    let(:data) do
      <<~DATA
        ###############
        #...#...#.....#
        #.#.#.#.#.###.#
        #S#...#.#.#...#
        #######.#.#.###
        #######.#.#...#
        #######.#.###.#
        ###..E#...#...#
        ###.#######.###
        #...###...#...#
        #.#####.#.###.#
        #.#...#.#.#...#
        #.#.#.#.#.#.###
        #...#...#...###
        ###############
      DATA
    end

    it { is_expected.to eq 5 }
  end
end
