# frozen_string_literal: true

describe AdventOfCode::Year2024::Day20::Part2 do
  describe "result" do
    subject { described_class.new(data, 70).result }

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

    it { is_expected.to eq 41 }
  end
end
