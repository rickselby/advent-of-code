# frozen_string_literal: true

describe AdventOfCode::Y2023::Day10a do
  describe "result" do
    subject { described_class.new(lines).result }

    context "with one given example" do
      let(:lines) do
        <<~MAP
          -L|F7
          7S-7|
          L|7||
          -L-J|
          L|-JF
        MAP
      end

      it { is_expected.to eq 4 }
    end

    context "with the other given example" do
      let(:lines) do
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
    data << <<~MAP
      .....
      .S-7.
      .|.|.
      .L-J.
      .....
    MAP
    data << <<~MAP
      .....
      .F-S.
      .|.|.
      .L-J.
      .....
    MAP
    data << <<~MAP
      .....
      .F-7.
      .|.|.
      .S-J.
      .....
    MAP
    data << <<~MAP
      .....
      .F-7.
      .|.|.
      .L-S.
      .....
    MAP

    data.each do |map|
      context "with map #{map}" do
        let(:lines) { map }

        it { is_expected.to eq 4 }
      end
    end
  end
end
