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
    @balance += amount


  end
end
