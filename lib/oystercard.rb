# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance
  attr_accessor :oystercard_status

  MAX_BALANCE = 90
  def initialize
    @balance = 0
    @oystercard_status = "not in use"
  end

  def top_up(amount)
    fail "Max balance of £#{MAX_BALANCE} exceeded." unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    if @oystercard_status == "not in use"
      return false
    elsif @oystercard_status == "in use"
      return true
    end
  end

  def touch_in
    @oystercard_status = "in use"
  end  

  def touch_out
    @oystercard_status = "not in use"
  end  
end
