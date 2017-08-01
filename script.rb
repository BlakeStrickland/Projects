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

p player.hand
# p "dealer.hand"
# p dealer.hand

players_hand_to_play = dealer.ask_to_play(player.hand)
dealers_hand_to_play = dealer.hand
p players_hand_to_play
# p dealers_hand_to_play

player_sf_array = dealer.has_straight_flush?(players_hand_to_play)
player_flush_array = dealer.has_flush?(players_hand_to_play)
p player.money




if player_sf_array[0] == true
  p "Wow a #{player_sf_array[1]} card straight flush"
  player.money += 100
end

if player_flush_array[0] == true
  p "Nice! a #{player_flush_array[1]} card flush"
  player.money += 30
else
  p "Better luck next time"
end

p player.money



#Dealer final_hand
dealer_sf_array = dealer.has_straight_flush?(dealers_hand_to_play)
dealer_flush_array = dealer.has_flush?(dealers_hand_to_play)


#TODO does player beat dealer



Mi  
# if dealer_flush_array[0] == false &&




# if dealer.has_straight_flush?(players_hand_to_play)[0]
#   p "Player has straight flush!"
# elsif dealer.has_flush?(players_hand_to_play)[0]
#   p "Player has flush!"
# end
