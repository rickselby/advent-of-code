# frozen_string_literal: true

describe AdventOfCode::Year2023::Day2::Line do
  describe "valid?" do
    subject { described_class.new(line).valid? }

    data = [
      ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", true],
      ["Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue", true],
      ["Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red", false],
      ["Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red", false],
      ["Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green", true]
    ]

    data.each do |string, result|
      context "with line #{string}" do
        let(:line) { string }

        it { is_expected.to eq result }
      end
    end
  end

  describe "game_id" do
    subject { described_class.new(line).game_id }

    data = [
      ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", 1],
      ["Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue", 2],
      ["Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red", 3],
      ["Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red", 4],
      ["Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green", 5]
    ]

    data.each do |string, result|
      context "with line #{string}" do
        let(:line) { string }

        it { is_expected.to eq result }
      end
    end
  end

  describe "power" do
    subject { described_class.new(line).power }

    data = [
      ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", 48],
      ["Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue", 12],
      ["Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red", 1560],
      ["Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red", 630],
      ["Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green", 36]
    ]

    data.each do |string, result|
      context "with line #{string}" do
        let(:line) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
