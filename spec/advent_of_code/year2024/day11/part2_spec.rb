# frozen_string_literal: true

describe AdventOfCode::Year2024::Day11::Part2 do
  describe "blink" do
    subject { described_class.new([]).blink(data) }

    data = [
      [{ 0 => 1, 1 => 1, 10 => 1, 99 => 1, 999 => 1 }, { 0 => 1, 1 => 2, 9 => 2, 2024 => 1, 2_021_976 => 1 }],
      [{ 17 => 1, 125 => 1 }, { 1 => 1, 7 => 1, 253_000 => 1 }],
    ]

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end

  describe "multi_blink" do
    subject { described_class.new([]).multi_blink(data, blink) }

    data = [
      [
        { 17 => 1, 125 => 1 },
        6,
        {
          0             => 2,
          2             => 4,
          3             => 1,
          4             => 1,
          6             => 2,
          7             => 1,
          8             => 1,
          40            => 2,
          48            => 2,
          80            => 1,
          96            => 1,
          2024          => 1,
          4048          => 1,
          14_168        => 1,
          2_097_446_912 => 1,
        },
      ],
    ]

    data.each do |string, times, result|
      context "with the input #{string}" do
        let(:data) { string }
        let(:blink) { times }

        it { is_expected.to eq result }
      end
    end
  end

  describe "result" do
    subject { described_class.new(data).result(25) }

    let(:data) do
      <<~DATA
        125 17
      DATA
    end

    it { is_expected.to eq 55_312 }
  end
end
