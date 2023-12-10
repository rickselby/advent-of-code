# frozen_string_literal: true

describe AdventOfCode::Year2023::Day1::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      DATA
    end

    it { is_expected.to eq 281 }
  end

  describe "value_for_line" do
    subject { described_class.new(nil).value_for_line line }

    data = [
      ["two1nine", 29],
      ["eightwothree", 83],
      ["abcone2threexyz", 13],
      ["xtwone3four", 24],
      ["4nineeightseven2", 42],
      ["zoneight234", 14],
      ["7pqrstsixteen", 76],
      ["six7pqrstsixteen", 66]
    ]

    data.each do |string, result|
      context "with line #{string}" do
        let(:line) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
