# frozen_string_literal: true

describe AdventOfCode::Year2024::Day06::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        ....#.....
        .........#
        ..........
        ..#.......
        .......#..
        ..........
        .#..^.....
        ........#.
        #.........
        ......#...
      DATA
    end

    it { is_expected.to eq 6 }
  end
end
