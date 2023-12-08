# frozen_string_literal: true

describe AdventOfCode::Y2023::Day3a do
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

      it { is_expected.to eq 4361 }
    end

    context "with numbers on the edge" do
      let(:lines) do
        <<~SCHEMATIC
          .1.
          1.1
          .1.
        SCHEMATIC
      end

      it { is_expected.to eq 0 }
    end

    context "with numbers on the edge to include" do
      let(:lines) do
        <<~SCHEMATIC
          .1.
          1*1
          .1.
        SCHEMATIC
      end

      it { is_expected.to eq 4 }
    end

    context "with a number that wraps" do
      let(:lines) do
        <<~SCHEMATIC
          ...
          .*1
          1..
        SCHEMATIC
      end

      it { is_expected.to eq 2 }
    end

    context "with an example from reddit" do
      let(:lines) do
        <<~SCHEMATIC
          ....
          .4..
          ..*.
        SCHEMATIC
      end

      it { is_expected.to eq 4 }
    end

    context "with another example from reddit" do
      let(:lines) do
        <<~SCHEMATIC
          ....................
          ..-52..52-..52..52..
          ..................-.
        SCHEMATIC
      end

      it { is_expected.to eq 156 }
    end

    context "with yet another example from reddit" do
      let(:lines) do
        <<~SCHEMATIC
          12.......*..
          +.........34
          .......-12..
          ..78........
          ..*....60...
          78.........9
          .5.....23..$
          8...90*12...
          ............
          2.2......12.
          .*.........*
          1.1..503+.56
        SCHEMATIC
      end

      it { is_expected.to eq 925 }
    end

    context "with more reddit samples" do
      let(:lines) do
        <<~SCHEMATIC
          .2.
          .*.
          585
        SCHEMATIC
      end

      it { is_expected.to eq 587 }
    end

    context "with yet more reddit samples" do
      let(:lines) do
        <<~SCHEMATIC
          ....11
          ......
          ....22
          33+...
          ......
          44+.44
          ......
          +55.55
          .....+
        SCHEMATIC
      end

      it { is_expected.to eq 187 }
    end

    context "with a sample of my own" do
      let(:lines) do
        <<~SCHEMATIC
          .2..
          ...*
        SCHEMATIC
      end

      it { is_expected.to eq 0 }
    end
  end
end
