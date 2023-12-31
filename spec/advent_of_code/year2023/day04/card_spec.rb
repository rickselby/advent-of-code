# frozen_string_literal: true

describe AdventOfCode::Year2023::Day04::Card do
  describe "points" do
    subject { described_class.new(card).points }

    data = [
      ["Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53", 8],
      ["Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19", 2],
      ["Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1", 2],
      ["Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83", 1],
      ["Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36", 0],
      ["Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11", 0],
    ]

    data.each do |string, result|
      context "with card #{string}" do
        let(:card) { string }

        it { is_expected.to eq result }
      end
    end
  end

  describe "winner?" do
    subject { described_class.new(card).winner? }

    data = [
      ["Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53", true],
      ["Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19", true],
      ["Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1", true],
      ["Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83", true],
      ["Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36", false],
      ["Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11", false],
    ]

    data.each do |string, result|
      context "with card #{string}" do
        let(:card) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
