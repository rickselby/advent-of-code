# frozen_string_literal: true

describe AdventOfCode::Year2015::Day06::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        turn on 0,0 through 4,4
        toggle 1,1 through 2,2
        turn on 3,3 through 4,4
        turn off 0,0 through 0,4
      DATA
    end

    it { is_expected.to eq 32 }
  end
end
