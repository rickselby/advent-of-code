# frozen_string_literal: true

describe AdventOfCode::Year2025::Day01::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with given example" do
      let(:data) do
        <<~DATA
          L68
          L30
          R48
          L5
          R60
          L55
          L1
          L99
          R14
          L82
        DATA
      end

      it { is_expected.to eq 6 }
    end

    context "with a big rotation left" do
      let(:data) do
        <<~DATA
          L1000
        DATA
      end

      it { is_expected.to eq 10 }
    end

    context "with a big rotation right" do
      let(:data) do
        <<~DATA
          R1000
        DATA
      end

      it { is_expected.to eq 10 }
    end

    context "when moving to zero exactly" do
      let(:data) do
        <<~DATA
          L50
        DATA
      end

      it { is_expected.to eq 1 }
    end

    context "when moving to zero exactly and then turning right" do
      let(:data) do
        <<~DATA
          L50
          R101
        DATA
      end

      it { is_expected.to eq 2 }
    end

    context "when moving to zero exactly with an overrotation left" do
      let(:data) do
        <<~DATA
          L150
        DATA
      end

      it { is_expected.to eq 2 }
    end

    context "when moving to zero exactly with an overrotation right" do
      let(:data) do
        <<~DATA
          R150
        DATA
      end

      it { is_expected.to eq 2 }
    end
  end
end
