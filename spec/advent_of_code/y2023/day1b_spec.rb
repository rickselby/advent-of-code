# frozen_string_literal: true

describe AdventOfCode::Y2023::Day1b do
  describe "result" do
    subject { described_class.new(lines).result }

    let(:lines) do
      "two1nine
       eightwothree
       abcone2threexyz
       xtwone3four
       4nineeightseven2
       zoneight234
       7pqrstsixteen"
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
