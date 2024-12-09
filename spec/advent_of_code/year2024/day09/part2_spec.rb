# frozen_string_literal: true

describe AdventOfCode::Year2024::Day09::Part2 do
  describe "result" do
    subject { described_class.new(str).result }

    data = {
      "2333133121414131402" => 2858,
      "51221"               => 23,
    }

    data.each do |str, result|
      context "with the input #{str}" do
        let(:str) { str }

        it { is_expected.to eq result }
      end
    end
  end
end
