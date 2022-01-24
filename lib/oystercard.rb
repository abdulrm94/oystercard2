# In order to use public transport
# As a customer
# I want money on my card

# Nouns: public transport, 

class Oystercard
  attr_reader :balance
  

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    @balance += amount
  end

end