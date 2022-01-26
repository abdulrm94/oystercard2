# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance
  attr_accessor :oystercard_status

  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance of £#{MAX_BALANCE} exceeded." unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end



  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Your balance is less than £#{MIN_AMOUNT}." unless @balance >= MIN_AMOUNT
    @in_journey = true
  end  

  def touch_out
    deduct(MIN_AMOUNT)
    @in_journey = false
  end
  
  private 
  
  def deduct(amount)
    @balance -= amount
  end

end
