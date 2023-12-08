# frozen_string_literal: true

describe AdventOfCode::Y2023::Day1a do
  describe "result" do
    subject { described_class.new(lines).result }

    let(:lines) do
      "1abc2
       pqr3stu8vwx
       a1b2c3d4e5f
       treb7uchet"
    end

    it { is_expected.to eq 142 }
  end

  describe "value_for_line" do
    subject { described_class.new(nil).value_for_line line }

    data = [
      ["1abc2", 12],
      ["pqr3stu8vwx", 38],
      ["a1b2c3d4e5f", 15],
      ["treb7uchet", 77]
    ]

    data.each do |string, result|
      context "with line #{string}" do
        let(:line) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
