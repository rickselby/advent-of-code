# frozen_string_literal: true

describe AdventOfCode::Year2015::Day05::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        qjhvhtzxzqqjkmpb
        xxyxx
        uurcxstgmygtbstg
        ieodomkazucvgmuy
      DATA
    end

    it { is_expected.to eq 2 }
  end

  describe "nice?" do
    subject { described_class.new([]).nice?(data) }

    data = {
      "qjhvhtzxzqqjkmpb" => true,
      "xxyxx"            => true,
      "uurcxstgmygtbstg" => false,
      "ieodomkazucvgmuy" => false,
    }

    data.each do |string, result|
      context "with the input #{string}" do
        let(:data) { string }

        it { is_expected.to eq result }
      end
    end
  end
end
