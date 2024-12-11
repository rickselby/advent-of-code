# frozen_string_literal: true

describe AdventOfCode::Year2024::Day11::Part1 do
  describe "blink" do
    subject { described_class.new([]).blink(data) }

    data = [
      [[0, 1, 10, 99, 999], [1, 2024, 1, 0, 9, 9, 2_021_976]],
      [[125, 17], [253_000, 1, 7]],
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
      [[125, 17], 6, [2_097_446_912, 14_168, 4048, 2, 0, 2, 4, 40, 48, 2024, 40, 48, 80, 96, 2, 8, 6, 7, 6, 0, 3, 2]],
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
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        125 17
      DATA
    end

    it { is_expected.to eq 55_312 }
  end
end
