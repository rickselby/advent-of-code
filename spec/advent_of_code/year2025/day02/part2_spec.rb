# frozen_string_literal: true

describe AdventOfCode::Year2025::Day02::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
      DATA
    end

    it { is_expected.to eq 4_174_379_265 }
  end
end
