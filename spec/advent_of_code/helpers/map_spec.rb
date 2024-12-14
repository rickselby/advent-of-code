# frozen_string_literal: true

describe AdventOfCode::Helpers::Map do
  let(:klass) { described_class.new(map.to_a) }
  let(:map) do
    [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16],
      [17, 18, 19, 20],
    ]
  end

  describe "#dig" do
    subject { klass.dig(1, 2) }

    it { is_expected.to eq 10 }
  end

  describe "#set" do
    it "sets a value" do
      klass.set(2, 1, :foo)
      expect(klass.map[1][2]).to eq :foo
    end
  end

  describe "width" do
    example { expect(klass.width).to eq 4 }
  end

  describe "height" do
    example { expect(klass.height).to eq 5 }
  end

  describe "#transpose" do
    let(:transposed_map) do
      [
        [1, 5, 9, 13, 17],
        [2, 6, 10, 14, 18],
        [3, 7, 11, 15, 19],
        [4, 8, 12, 16, 20],
      ]
    end

    it "transposes the map in place" do
      klass.transpose
      expect(klass.map).to eq transposed_map
    end
  end

  describe "#rotate" do
    context "when counter clockwise" do
      let(:rotated_map) do
        [
          [4, 8, 12, 16, 20],
          [3, 7, 11, 15, 19],
          [2, 6, 10, 14, 18],
          [1, 5, 9, 13, 17],
        ]
      end

      it "transposes the map in place" do
        klass.rotate
        expect(klass.map).to eq rotated_map
      end
    end

    context "when clockwise" do
      let(:rotated_map) do
        [
          [17, 13, 9, 5, 1],
          [18, 14, 10, 6, 2],
          [19, 15, 11, 7, 3],
          [20, 16, 12, 8, 4],
        ]
      end

      it "transposes the map in place" do
        klass.rotate(:cw)
        expect(klass.map).to eq rotated_map
      end
    end
  end

  describe "#diagonals" do
    let(:diagonals) do
      [
        [17],
        [13, 18],
        [9, 14, 19],
        [5, 10, 15, 20],
        [1, 6, 11, 16],
        [2, 7, 12],
        [3, 8],
        [4],
      ]
    end

    example { expect(klass.diagonals).to eq diagonals }
  end

  describe "#in_range?" do
    example { expect(klass).to be_in_range(1, 2) }
    example { expect(klass).not_to be_in_range(-1, 2) }
    example { expect(klass).not_to be_in_range(1, 5) }
    example { expect(klass).not_to be_in_range(4, 1) }
  end

  describe "#out_of_range?" do
    example { expect(klass).not_to be_out_of_range(1, 2) }
    example { expect(klass).to be_out_of_range(-1, 2) }
    example { expect(klass).to be_out_of_range(1, 5) }
    example { expect(klass).to be_out_of_range(4, 1) }
  end

  describe "#find" do
    example { expect(klass.find(5)).to eq [0, 1] }
    example { expect(klass.find(11)).to eq [2, 2] }
  end

  describe "#rows" do
    example { expect(klass.rows).to eq map }
  end

  describe "#cols" do
    example { expect(klass.cols).to eq map.transpose }
  end

  describe "#count" do
    let(:map) do
      [
        [1, 2],
        [5, 1],
        [9, 1],
      ]
    end

    example { expect(klass.count(1)).to eq 3 }
  end
end
