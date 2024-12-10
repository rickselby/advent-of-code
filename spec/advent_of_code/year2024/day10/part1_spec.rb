# frozen_string_literal: true

describe AdventOfCode::Year2024::Day10::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        89010123
        78121874
        87430965
        96549874
        45678903
        32019012
        01329801
        10456732
      DATA
    end

    it { is_expected.to eq 36 }
  end
end
