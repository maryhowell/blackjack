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
  
end

# class Hand
# end
