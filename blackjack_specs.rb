require './blackjack'
require './Play_blackJack'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCard < Minitest::Test
  def test_number_card_value
    2.upto(10) do |x|
      card = Card.new(x, :S)
      assert_equal card.value, x
    end
  end

  def test_face_card_value
    [:K, :Q, :J].each do |rank|
      card = Card.new(rank, :H)
      assert_equal 10, card.value
    end
  end
end

class TestDeck < Minitest::Test
  def test_counting_cards
    deck = Deck.new
    assert_equal 52, deck.cards.count
  end

  def test_counting_draws
    deck = Deck.new
    deck.draw
    assert_equal 51, deck.cards.count
  end

  def test_tracking_draws
    deck = Deck.new
    drawn_card = deck.draw
    assert_equal 51, deck.cards.count
    refute_includes deck.cards, drawn_card
    assert_includes deck.drawn, drawn_card
  end
end

class TestHand < Minitest::Test
  def test_hand_value_with_number_cards
    hand = Hand.new
    hand.add(Card.new(9, :H), Card.new(7, :S))
    assert_equal 16, hand.value

    hand.add(Card.new(4, :D))
    assert_equal 20, hand.value
  end

  def test_hand_value_with_face_cards
    hand = Hand.new
    hand.add(Card.new(9, :H), Card.new(:K, :S))
    assert_equal 19, hand.value
  end

  def test_hand_value_with_aces
    hand = Hand.new
    hand.add(Card.new(:A, :H), Card.new(:K, :S))
    assert_equal 21, hand.value

    hand.add(Card.new(5, :S))
    assert_equal 16, hand.value
  end

  def test_busting
    hand = Hand.new
    hand.add(Card.new(6, :H), Card.new(:K, :S), Card.new(9, :H))
    assert hand.busted?
  end

  def test_blackjack
    hand = Hand.new
    hand.add(Card.new(:A, :H), Card.new(:K, :S))
    assert hand.blackjack?
  end

#   def test_hand_as_string
#     hand = Hand.new
#     hand.add(Card.new(:A, :H), Card.new(:K, :S))
#     hand.add(Card.new(5, :S))
#     assert_equal hand.to_s, 'AH, KS, 5S'
#   end
end
