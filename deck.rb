class Deck
  attr_reader :deck_in_play
  def initialize
    @deck_in_play = create_deck()
  end

  def create_deck
    array = ["Ace", "King", "Queen", "Jack", 10, 9 , 8, 7, 6, 5, 4, 3, 2]
    ready_deck = []

    array.each do |card|
      ready_deck << card.to_s + " of Spades"
    end

    array.each do |card|
      ready_deck << card.to_s + " of Hearts"
    end

    array.each do |card|
      ready_deck << card.to_s + " of Clubs"
    end

    array.each do |card|
      ready_deck << card.to_s + " of Diamonds"
    end

    ready_deck = ready_deck.shuffle!
  end

end
