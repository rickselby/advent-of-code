# frozen_string_literal: true

describe AdventOfCode::Algorithms::Shoelace, :result do
  subject { described_class.new(coordinates).with_border }

  context "with a simple square" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [0, 2]] }

    it { is_expected.to eq 9 }
  end

  context "with a more complex shape" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [4, 2], [4, 4], [0, 4]] }

    it { is_expected.to eq 21 }
  end
end
