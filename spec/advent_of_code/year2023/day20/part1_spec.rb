# frozen_string_literal: true

describe AdventOfCode::Year2023::Day20::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the first example" do
      let(:data) do
        <<~DATA
          broadcaster -> a, b, c
          %a -> b
          %b -> c
          %c -> inv
          &inv -> a
        DATA
      end

      it { is_expected.to eq 32_000_000 }
    end

    context "with the second example" do
      let(:data) do
        <<~DATA
          broadcaster -> a
          %a -> inv, con
          &inv -> b
          %b -> con
          &con -> output
        DATA
      end

      it { is_expected.to eq 11_687_500 }
    end
  end
end
