# frozen_string_literal: true

describe AdventOfCode::Year2024::Day09::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        2333133121414131402
      DATA
    end

    it { is_expected.to eq 1928 }
  end
end
