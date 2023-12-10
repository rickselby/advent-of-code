# frozen_string_literal: true

describe AdventOfCode::Year2023::Day7::Part1 do
  describe "result" do
    subject { described_class.new(data).result }

    context "with the given example" do
      let(:data) do
        <<~DATA
          32T3K 765
          T55J5 684
          KK677 28
          KTJJT 220
          QQQJA 483
        DATA
      end

      it { is_expected.to eq 6440 }
    end

    context "with a weirdness in the output" do
      let(:data) do
        <<~DATA
          JTTTT 10
          3333J 20
        DATA
      end

      it { is_expected.to eq 40 }
    end
  end

  describe "hand_type" do
    subject { described_class.new(nil).hand_type(hand) }

    data = {
      "11111" => AdventOfCode::Year2023::Day7::Part1::HANDS[:five_of_a_kind],
      "11112" => AdventOfCode::Year2023::Day7::Part1::HANDS[:four_of_a_kind],
      "11222" => AdventOfCode::Year2023::Day7::Part1::HANDS[:full_house],
      "11123" => AdventOfCode::Year2023::Day7::Part1::HANDS[:three_of_a_kind],
      "11223" => AdventOfCode::Year2023::Day7::Part1::HANDS[:two_pair],
      "11234" => AdventOfCode::Year2023::Day7::Part1::HANDS[:one_pair],
      "12345" => AdventOfCode::Year2023::Day7::Part1::HANDS[:high_card]
    }

    data.each do |hand, type|
      hand.chars.permutation.each do |cards|
        context "with the cards #{cards}" do
          let(:hand) { cards.join }

          it { is_expected.to eq type }
        end
      end
    end
  end
end
