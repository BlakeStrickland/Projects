#the script
require_relative "../Projects/deck"
require_relative "../Projects/player"
require_relative "../Projects/dealer"
require_relative "../Projects/game"


current_game = Game.new(1)
puts "Welcome"
player = current_game.players.first
dealer = current_game.dealer
deck = dealer.deck.deck_in_play

hand_and_deck = dealer.deal_cards(player, deck)
player.hand = hand_and_deck[0]
deck = hand_and_deck[1]

hand_and_deck = dealer.deal_cards(dealer, deck)
dealer.hand = hand_and_deck[0]
deck = hand_and_deck[1]

p "player.hand"
p player.hand
p "dealer.hand"
p dealer.hand

players_hand_to_play = dealer.ask_for_cards(player.hand)
dealers_hand_to_play = dealer.hand
p players_hand_to_play
p dealers_hand_to_play

#Player final_hand
p dealer.has_straight_flush?(players_hand_to_play)
p dealer.has_flush?(players_hand_to_play)

#Dealer final_hand
p dealer.has_straight_flush?(dealers_hand_to_play)
p dealer.has_flush?(dealers_hand_to_play)



# if dealer.has_straight_flush?(players_hand_to_play)[0]
#   p "Player has straight flush!"
# elsif dealer.has_flush?(players_hand_to_play)[0]
#   p "Player has flush!"
# end
