# frozen_string_literal: true

describe AdventOfCode::Algorithms::Shoelace, :result do
  subject { described_class.new(coordinates).result }

  context "with a simple square" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [0, 2]] }

    it { is_expected.to eq 4 }
  end

  context "with a more complex shape" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [4, 2], [4, 4], [0, 4]] }

    it { is_expected.to eq 12 }
  end

  context "with an example from the math doctors" do
    let(:coordinates) { [[-2, -2], [0, 4], [3, -1], [1, -1]] }

    it { is_expected.to eq 13 }
  end

  context "with another example from the math doctors" do
    let(:coordinates) { [[1, -4], [3, 2], [6, -3], [4, -3]] }

    it { is_expected.to eq 13 }
  end
end
