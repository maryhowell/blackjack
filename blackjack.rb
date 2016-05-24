require "pry"

class Card
  attr_reader :rank, :suit
  def initialize rank, suit
    @rank, @suit = rank, suit
  end

  def value
    if (2 .. 10).include? @rank
      @rank
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
  attr_reader :value

  def initialize
    @value = 0
  end

  def add card_1, card_2 = nil
    if card_2 == nil
      @value = @value + card_1.value
    else
      @value = card_1.value + card_2.value
    end
  end

end
