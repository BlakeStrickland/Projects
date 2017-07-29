class Dealer
  attr_accessor :hand, :players, :deck

  def initialize(deck, players)
    @deck = deck
    @players = players
    @hand = []
  end

  def deal_cards(player, deck)
    player.hand = deck.slice!(0..6)
    [player.hand, deck]
  end

  def has_flush?(hand)
    hearts = 0
    spades = 0
    diamonds = 0
    clubs = 0

    hand.each do |card|
      if card.include?("Spades")
        spades += 1
      end
    end
    hand.each do |card|
      if card.include?("Hearts")
        hearts += 1
      end
    end
    hand.each do |card|
      if card.include?("Diamonds")
        diamonds += 1
      end
    end
    hand.each do |card|
      if card.include?("Clubs")
        clubs += 1
      end
    end

    flush_counts = [hearts, spades, diamonds, clubs]
    flush_results = []
    flush_counts.each do |suit_count|
      flush_check = is_flush?(suit_count)
      if flush_check[0] == true
        flush_results << flush_check
      end
    end

    if flush_results == []
      flush_results = [false, 0]
    end
    flush_results.flatten!
    flush_results
  end

  def is_flush?(suit_count)

    if suit_count == 7
      [true, 7]
    elsif suit_count == 6
      [true, 6]
    elsif suit_count == 5
      [true, 5]
    elsif suit_count == 4
      [true, 4]
    elsif suit_count == 3
      [true, 3]
    elsif suit_count == 2
      [false, 2]
    elsif suit_count == 1
      [false, 1]
    else
      [false, suit_count]
    end
  end

  def ask_to_play(your_cards)
    valid_play = false
    until valid_play == true
      puts "Which cards would you like to play? or type 'fold'"
      puts "Ex) 1347 or 1 4 6 "
      players_decision = gets.chomp

      if (/^(?<num>\d+)$/ =~ players_decision) == nil
        valid_play = false
      else
        valid_play = true
      end
    end

    cards_integer_array = []

    if players_decision.downcase! == "fold"
      [false]
    else
      players_decision = players_decision.gsub(/\s+/, "")
      players_decision.each_char { |chr|  cards_integer_array << chr.to_i}
    end

    create_final_hand(cards_integer_array, your_cards)
  end

  def create_final_hand(cards_integer_array, your_cards)
    final_hand = []
    cards_integer_array.each do |card_number|
      this_one = card_number - 1
      final_hand << your_cards[this_one]
    end
    final_hand
  end


  def create_card_value_array(hand)
    card_value = 0
    value_array = []
    hand.each do |card|
      card = card.to_s
      if card.include?("Ace")
        value_array << [1,14]
      elsif card.include?("King")
        value_array << [13]
      elsif card.include?("Queen")
        value_array << [12]
      elsif card.include?("Jack")
        value_array << [11]
      elsif card.include?("10")
        value_array << [10]
      elsif card.include?("9")
        value_array << [9]
      elsif card.include?("8")
        value_array << [8]
      elsif card.include?("7")
        value_array << [7]
      elsif card.include?("6")
        value_array << [6]
      elsif card.include?("5")
        value_array << [5]
      elsif card.include?("4")
        value_array << [4]
      elsif card.include?("3")
        value_array << [3]
      elsif card.include?("2")
        value_array << [2]
      else
        value_array
      end
      value_array
    end
    value_array = value_array.flatten!.sort!

    value_array
  end

  def has_straight?(hand)
    value_array = create_card_value_array(hand)
    is_straight_array = is_straight?(value_array)
  end

  def is_straight?(array)
    value_array = array
    straight_result = []
    if (value_array.length == 7) && (value_array.first + 7 == value_array.last)
      straight_result << [true, 7]
    elsif (value_array.length == 6) && (value_array.first + 6 == value_array.last)
      straight_result << [true, 6]
    elsif (value_array.length == 5) && (value_array.first + 5 == value_array.last)
      straight_result << [true, 5]
    elsif (value_array.length == 4) && (value_array.first + 4 == value_array.last)
      straight_result << [true, 4]
    elsif (value_array.length == 3) && (value_array.first + 3 == value_array.last)
      straight_result << [true, 3]
    else
      straight_result << [false, value_array.length]
    end
    straight_result.flatten!
    straight_result
  end

  def has_straight_flush?(hand)
    straight_flush_result = [false, 0]

    if (has_flush?(hand)[0] == true) && (has_straight?(hand)[0] == true)
      straight_flush_result << has_straight?(hand)[1]
    end
    # straight_flush_result.flatten
    straight_flush_result
  end

end
