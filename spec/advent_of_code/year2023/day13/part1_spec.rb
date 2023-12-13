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

  describe "map_value" do
    subject { described_class.new(nil).map_value(map) }

    maps = []
    maps[0] = <<~DATA
      #.##..##.
      ..#.##.#.
      ##......#
      ##......#
      ..#.##.#.
      ..##..##.
      #.#.##.#.
    DATA

    maps[1] = <<~DATA
      #...##..#
      #....#..#
      ..##..###
      #####.##.
      #####.##.
      ..##..###
      #....#..#
    DATA

    data = [
      [maps[0], 5],
      [maps[1], 400]
    ]

    data.each do |map, result|
      context "with map #{map}" do
        let(:map) { map.lines.map(&:strip) }

        it { is_expected.to eq result }
      end
    end
  end
end
