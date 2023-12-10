# frozen_string_literal: true

describe AdventOfCode::Year2023::Day7::Part2 do
  describe "result" do
    subject { described_class.new(data).result }

    let(:data) do
      <<~DATA
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
      DATA
    end

    it { is_expected.to eq 5905 }
  end

  describe "hand_type" do
    subject { described_class.new(nil).hand_type(hand) }

    data = {
      "11111" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "11112" => AdventOfCode::Y2023::Day7b::HANDS[:four_of_a_kind],
      "11222" => AdventOfCode::Y2023::Day7b::HANDS[:full_house],
      "11123" => AdventOfCode::Y2023::Day7b::HANDS[:three_of_a_kind],
      "11223" => AdventOfCode::Y2023::Day7b::HANDS[:two_pair],
      "11234" => AdventOfCode::Y2023::Day7b::HANDS[:one_pair],
      "12345" => AdventOfCode::Y2023::Day7b::HANDS[:high_card],
      "1111J" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "111JJ" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "11JJJ" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "1JJJJ" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "JJJJJ" => AdventOfCode::Y2023::Day7b::HANDS[:five_of_a_kind],
      "111J2" => AdventOfCode::Y2023::Day7b::HANDS[:four_of_a_kind],
      "11JJ2" => AdventOfCode::Y2023::Day7b::HANDS[:four_of_a_kind],
      "1JJJ2" => AdventOfCode::Y2023::Day7b::HANDS[:four_of_a_kind],
      "11J22" => AdventOfCode::Y2023::Day7b::HANDS[:full_house],
      "11J23" => AdventOfCode::Y2023::Day7b::HANDS[:three_of_a_kind],
      "1JJ23" => AdventOfCode::Y2023::Day7b::HANDS[:three_of_a_kind],
      "1J234" => AdventOfCode::Y2023::Day7b::HANDS[:one_pair]
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
