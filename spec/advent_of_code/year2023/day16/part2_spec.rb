# frozen_string_literal: true

describe AdventOfCode::Year2023::Day16::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the given example" do
      let(:data) do
        <<~DATA
          .|...\\....
          |.-.\\.....
          .....|-...
          ........|.
          ..........
          .........\\
          ..../.\\\\..
          .-.-/..|..
          .|....-|.\\
          ..//.|....
        DATA
      end

      it { is_expected.to eq 51 }
    end

    context "with my example" do
      let(:data) do
        <<~DATA
          ./-\\.
          .\\./.
        DATA
      end

      it { is_expected.to eq 6 }
    end
  end
end
