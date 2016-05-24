require "pry"

class Card
  attr_reader :rank, :suit
  def initialize rank, suit
    @rank, @suit = rank, suit
  end

  def value
    if (2 .. 10).include? @rank
      @rank
    elsif @rank == :A
      11
    else
      10
    end
  end
end

class Deck
  attr_reader :cards, :drawn_card

  def initialize
    @cards = (1 .. 52).to_a
    @drawn_card = []
  end

  def draw
    new_card = @cards.shuffle!.pop
    @drawn_card.push(new_card)
    new_card
  end

  def drawn
    @drawn_card
  end
end

class Hand
  attr_reader :current_hand

  def initialize
    @current_hand = []
  end

  def add *cards
      cards.each do |card|
        @current_hand.push card
    end
  end

  def value
    total = 0
    @current_hand.each do |card|
      total += card.value
    end
    if total <= 21
      return total
    else
      total = 0
      @current_hand.each do |card|
        if card.rank == :A
          total += 1
        else
          total += card.value
        end
      end
    return total
  end
  end

  def busted?
    value > 21
  end

  def blackjack?
    value == 21
  end


  def to_s
    a_card_elements = []
    card_s_array = []
    current_hand.each do |card|
      card_elements = []
      card_elements.push card.rank, card.suit
      a_card_elements.push(card_elements)
    end
    a_card_elements.each do |pair|
      card_s_array.push pair.join
    end
    card_s_array.join", "
  end

end
