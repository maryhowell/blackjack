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
  attr_reader :value

  def initialize
    @value = 0
    @current_hand = []
  end

  def add card_1, card_2 = nil
    if card_2.nil?
      @current_hand.push(card_1)
    else
    @current_hand.push(card_1).push(card_2)
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
end
