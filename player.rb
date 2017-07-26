class Player
  attr_accessor :hand, :money

  def initialize(money: 100)
    @money = money
    @hand = []

  end


  # def bet(amount)
  #   if amount < MIN_BET
  #     print "All bets need to be above the minimal requirement ($10)"
  #   elsif amount > self.money
  #     print "Insufficent funds"
  #   else
  #     self.money = self.money - amount.to_f
  #   end
  # end

end
