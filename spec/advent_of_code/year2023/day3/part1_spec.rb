# frozen_string_literal: true

describe AdventOfCode::Year2023::Day3::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the given example" do
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

      it { is_expected.to eq 4361 }
    end

    context "with numbers on the edge" do
      let(:data) do
        <<~DATA
          .1.
          1.1
          .1.
        DATA
      end

      it { is_expected.to eq 0 }
    end

    context "with numbers on the edge to include" do
      let(:data) do
        <<~DATA
          .1.
          1*1
          .1.
        DATA
      end

      it { is_expected.to eq 4 }
    end

    context "with a number that wraps" do
      let(:data) do
        <<~DATA
          ...
          .*1
          1..
        DATA
      end

      it { is_expected.to eq 2 }
    end

    context "with an example from reddit" do
      let(:data) do
        <<~DATA
          ....
          .4..
          ..*.
        DATA
      end

      it { is_expected.to eq 4 }
    end

    context "with another example from reddit" do
      let(:data) do
        <<~DATA
          ....................
          ..-52..52-..52..52..
          ..................-.
        DATA
      end

      it { is_expected.to eq 156 }
    end

    context "with yet another example from reddit" do
      let(:data) do
        <<~DATA
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
        DATA
      end

      it { is_expected.to eq 925 }
    end

    context "with more reddit samples" do
      let(:data) do
        <<~DATA
          .2.
          .*.
          585
        DATA
      end

      it { is_expected.to eq 587 }
    end

    context "with yet more reddit samples" do
      let(:data) do
        <<~DATA
          ....11
          ......
          ....22
          33+...
          ......
          44+.44
          ......
          +55.55
          .....+
        DATA
      end

      it { is_expected.to eq 187 }
    end

    context "with a sample of my own" do
      let(:data) do
        <<~DATA
          .2..
          ...*
        DATA
      end

      it { is_expected.to eq 0 }
    end
  end
end
