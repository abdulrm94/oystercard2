# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance


  MAX_BALANCE = 90
  
  
  def initialize
    @balance = 0
  end

  def top_up(amount)
    # limit_exceeded = "Top up failed. Max limit is £#{MAX_BALANCE}. You have tried to top up £#{amount}. Current balance is still £#{balance}."
    
    fail "Max balance of £#{MAX_BALANCE} exceeded." unless @balance + amount <= MAX_BALANCE

    @balance += amount
  end
end

