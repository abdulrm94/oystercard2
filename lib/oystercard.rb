# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  
  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    limit_exceeded = "Max limit is £90."
    
    fail "test" unless @balance + amount <= MAX_BALANCE

    # THIS WAS THE CULPRINT VVV IT SHOULD HAVE GONE LAST AFTER THE FAIL. 
    # BECAUSE THE BALANCE SHOULDNT BE ADDED TO THE AMOUNT UNLESS THE TOTAL WILL BE LESS THAN 90!!! ARGH
    @balance += amount


  end
end

# test = Oystercard.new

# p test.top_up(100)

