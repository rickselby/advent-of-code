# frozen_string_literal: true

describe AdventOfCode::Algorithms::Shoelace, :perimeter do
  subject { described_class.new(coordinates).perimeter }

  context "with a simple square" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [0, 2]] }

    it { is_expected.to eq 8 }
  end

  context "with a more complex shape" do
    let(:coordinates) { [[0, 0], [2, 0], [2, 2], [4, 2], [4, 4], [0, 4]] }

    it { is_expected.to eq 16 }
  end
end
