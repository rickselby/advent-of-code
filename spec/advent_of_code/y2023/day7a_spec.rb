# frozen_string_literal: true

describe AdventOfCode::Y2023::Day7a do
  describe "result" do
    subject { described_class.new(lines).result }

    context "with the given example" do
      let(:lines) do
        <<~HANDS
          32T3K 765
          T55J5 684
          KK677 28
          KTJJT 220
          QQQJA 483
        HANDS
      end

      it { is_expected.to eq 6440 }
    end

    context "with a weirdness in the output" do
      let(:lines) do
        <<~HANDS
          JTTTT 10
          3333J 20
        HANDS
      end

      it { is_expected.to eq 40 }
    end
  end

  describe "hand_type" do
    subject { described_class.new(nil).hand_type(hand) }

    data = {
      "11111" => AdventOfCode::Y2023::Day7a::HANDS[:five_of_a_kind],
      "11112" => AdventOfCode::Y2023::Day7a::HANDS[:four_of_a_kind],
      "11222" => AdventOfCode::Y2023::Day7a::HANDS[:full_house],
      "11123" => AdventOfCode::Y2023::Day7a::HANDS[:three_of_a_kind],
      "11223" => AdventOfCode::Y2023::Day7a::HANDS[:two_pair],
      "11234" => AdventOfCode::Y2023::Day7a::HANDS[:one_pair],
      "12345" => AdventOfCode::Y2023::Day7a::HANDS[:high_card]
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
