# frozen_string_literal: true

describe AdventOfCode::Year2023::Day21::Part2 do
  describe "result" do
    let(:data) do
      <<~DATA
        ...........
        .....###.#.
        .###.##..#.
        ..#.#...#..
        ....#.#....
        .##..S####.
        .##..#...#.
        .......##..
        .##.#.####.
        .##..##.##.
        ...........
      DATA
    end

    example { expect(described_class.new(data).result).to eq 10 }

    example { expect(described_class.new(data).steps(6)).to eq 16 }
    example { expect(described_class.new(data).steps(10)).to eq 50 }
    example { expect(described_class.new(data).steps(50)).to eq 1594 }
    example { expect(described_class.new(data).steps(100)).to eq 6536 }
    # example { expect(described_class.new(data).steps(500)).to eq 167_004 }
    # example { expect(described_class.new(data).steps(1000)).to eq 668_697 }
    # example { expect(described_class.new(data).steps(5000)).to eq 16_733_044 }
  end

  describe "something else" do
    let(:data) do
      <<~DATA
        ...........
        ......##.#.
        .###..#..#.
        ..#.#...#..
        ....#.#....
        .....S.....
        .##......#.
        .......##..
        .##.#.####.
        .##...#.##.
        ...........
      DATA
    end

    example { expect(described_class.new(data).result).to eq 15 }
  end
end
