# frozen_string_literal: true

describe AdventOfCode::Y2023::Day3b do
  describe "result" do
    subject { described_class.new(lines).result }

    context "with the given example" do
      let(:lines) do
        <<~SCHEMATIC
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
        SCHEMATIC
      end

      it { is_expected.to eq 467_835 }
    end
  end
end
