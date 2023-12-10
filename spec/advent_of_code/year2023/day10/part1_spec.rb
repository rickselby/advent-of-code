# frozen_string_literal: true

describe AdventOfCode::Year2023::Day10::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with one given example" do
      let(:data) do
        <<~DATA
          -L|F7
          7S-7|
          L|7||
          -L-J|
          L|-JF
        DATA
      end

      it { is_expected.to eq 4 }
    end

    context "with the other given example" do
      let(:data) do
        <<~MAP
          7-F7-
          .FJ|7
          SJLL7
          |F--J
          LJ.LJ
        MAP
      end

      it { is_expected.to eq 8 }
    end

    data = []
    data << <<~DATA
      .....
      .S-7.
      .|.|.
      .L-J.
      .....
    DATA
    data << <<~DATA
      .....
      .F-S.
      .|.|.
      .L-J.
      .....
    DATA
    data << <<~DATA
      .....
      .F-7.
      .|.|.
      .S-J.
      .....
    DATA
    data << <<~DATA
      .....
      .F-7.
      .|.|.
      .L-S.
      .....
    DATA

    data.each do |map|
      context "with map #{map}" do
        let(:data) { map }

        it { is_expected.to eq 4 }
      end
    end
  end
end
