# frozen_string_literal: true

describe AdventOfCode::Year2023::Day10::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with a really simple example" do
      let(:data) do
        <<~DATA
          ......
          .S--7.
          .|..|.
          .|..|.
          .L--J.
          ......
        DATA
      end

      it { is_expected.to eq 4 }
    end

    context "with one given example" do
      let(:data) do
        <<~DATA
          ...........
          .S-------7.
          .|F-----7|.
          .||.....||.
          .||.....||.
          .|L-7.F-J|.
          .|..|.|..|.
          .L--J.L--J.
          ...........
        DATA
      end

      it { is_expected.to eq 4 }
    end

    context "with the second given example" do
      let(:data) do
        <<~DATA
          .F----7F7F7F7F-7....
          .|F--7||||||||FJ....
          .||.FJ||||||||L7....
          FJL7L7LJLJ||LJ.L-7..
          L--J.L7...LJS7F-7L7.
          ....F-J..F7FJ|L7L7L7
          ....L7.F7||L7|.L7L7|
          .....|FJLJ|FJ|F7|.LJ
          ....FJL-7.||.||||...
          ....L---J.LJ.LJLJ...
        DATA
      end

      it { is_expected.to eq 8 }
    end

    context "with the third given example" do
      let(:data) do
        <<~DATA
          FF7FSF7F7F7F7F7F---7
          L|LJ||||||||||||F--J
          FL-7LJLJ||||||LJL-77
          F--JF--7||LJLJ7F7FJ-
          L---JF-JLJ.||-FJLJJ7
          |F|F-JF---7F7-L7L|7|
          |FFJF7L7F-JF7|JL---7
          7-L-JL7||F7|L7F-7F7|
          L.L7LFJ|||||FJL7||LJ
          L7JLJL-JLJLJL--JLJ.L
        DATA
      end

      it { is_expected.to eq 10 }
    end
  end
end
