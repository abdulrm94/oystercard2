# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Max balance of £#{MAX_BALANCE} exceeded." unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
