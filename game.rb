class Game
  attr_accessor :deck, :players, :dealer

  def initialize(number_of_players)
    @players = create_players(number_of_players)
    @deck = Deck.new
    @dealer = Dealer.new(deck, players)
  end

  def create_players(number_of_players)
    players = []
    number_of_players.times { players << Player.new() }
    players
  end
end
