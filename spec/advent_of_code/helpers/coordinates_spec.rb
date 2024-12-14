# frozen_string_literal: true

describe AdventOfCode::Helpers::Coordinates do
  let(:klass) { described_class.new(x, y) }
  let(:x) { 1 }
  let(:y) { 2 }

  describe "#coordinates" do
    example { expect(klass.coordinates).to eql([x, y]) }
  end

  describe "#move" do
    example { expect(klass.move(:up).coordinates).to eq [x, y - 1] }
    example { expect(klass.move(:north).coordinates).to eq [x, y - 1] }
    example { expect(klass.move(:right).coordinates).to eq [x + 1, y] }
    example { expect(klass.move(:east).coordinates).to eq [x + 1, y] }
    example { expect(klass.move(:down).coordinates).to eq [x, y + 1] }
    example { expect(klass.move(:south).coordinates).to eq [x, y + 1] }
    example { expect(klass.move(:left).coordinates).to eq [x - 1, y] }
    example { expect(klass.move(:west).coordinates).to eq [x - 1, y] }

    example { expect(klass.move(:up_left).coordinates).to eq [x - 1, y - 1] }
    example { expect(klass.move(:north_west).coordinates).to eq [x - 1, y - 1] }
    example { expect(klass.move(:up_right).coordinates).to eq [x + 1, y - 1] }
    example { expect(klass.move(:north_east).coordinates).to eq [x + 1, y - 1] }
    example { expect(klass.move(:down_right).coordinates).to eq [x + 1, y + 1] }
    example { expect(klass.move(:south_east).coordinates).to eq [x + 1, y + 1] }
    example { expect(klass.move(:down_left).coordinates).to eq [x - 1, y + 1] }
    example { expect(klass.move(:south_west).coordinates).to eq [x - 1, y + 1] }
  end

  describe "#adjacent" do
    let(:expected) do
      [
        described_class.new(x, y - 1),
        described_class.new(x + 1, y),
        described_class.new(x, y + 1),
        described_class.new(x - 1, y),
      ]
    end

    example { expect(klass.adjacent).to eq expected }
  end
end
