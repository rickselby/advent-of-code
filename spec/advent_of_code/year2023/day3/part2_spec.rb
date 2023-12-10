# frozen_string_literal: true

describe AdventOfCode::Year2023::Day3::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      DATA
    end

    it { is_expected.to eq 467_835 }
  end
end
