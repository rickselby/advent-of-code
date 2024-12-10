# frozen_string_literal: true

describe AdventOfCode::Year2015::Day07::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        123 -> x
        456 -> y
        x AND y -> d
        x OR y -> e
        x LSHIFT 2 -> f
        y RSHIFT 2 -> g
        NOT x -> h
        NOT y -> a
      DATA
    end

    it { is_expected.to eq 65_079 }
  end
end
