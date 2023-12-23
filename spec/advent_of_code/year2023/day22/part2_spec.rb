# frozen_string_literal: true

describe AdventOfCode::Year2023::Day22::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the given example" do
      let(:data) do
        <<~DATA
          1,0,1~1,2,1
          0,0,2~2,0,2
          0,2,3~2,2,3
          0,0,4~0,2,4
          2,0,5~2,2,5
          0,1,6~2,1,6
          1,1,8~1,1,9
        DATA
      end

      it { is_expected.to eq 7 }
    end

    context "with another example" do
      let(:data) do
        <<~DATA
          1,0,1~1,2,1
          1,0,2~1,2,2
          1,0,3~1,2,3
          1,0,4~1,2,4
        DATA
      end

      it { is_expected.to eq 6 }
    end

    context "with a different example" do
      let(:data) do
        <<~DATA
          0,0,2~0,0,4
          1,0,3~2,0,3
          1,0,4~1,0,5
          0,0,6~1,0,6
        DATA
      end

      it { is_expected.to eq 1 }
    end
  end
end
