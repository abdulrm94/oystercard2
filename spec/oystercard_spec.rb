require 'oystercard'

describe Oystercard do

  let(:oystercard) {Oystercard.new}
  let(:maxbalance) {Oystercard::MAX_BALANCE}
  
  # check method balance exists
  it {expect(oystercard).to respond_to(:balance)}

  # expect starting balance to equal 0
  it {expect(oystercard.balance).to eq(0)}

  #check method top_up exists
  it {expect(oystercard).to respond_to(:top_up)}

  it "checks that top_up will add a given amount to the balance" do
    oystercard.top_up(50)
    expect(oystercard.balance).to eq(50)
  end
  
  it "checks that top_up will sum given amounts to the balance" do
    oystercard.top_up(10)
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(20)
  end

  it "raise error if max balance exceeded" do
    expect {oystercard.top_up(1999)}.to raise_error "Max balance of £#{maxbalance} exceeded."
  end

  #check method deduct exists
  it {expect(oystercard).to respond_to(:deduct)}

  it "checks that deduct will deduct a given amount to the balance" do
    oystercard.deduct(5)
    expect(oystercard.balance).to eq(-5)
  end

  it "checks that deduct will deduct multiple given amounts to the balance" do
    oystercard.deduct(5)
    oystercard.deduct(5)
    expect(oystercard.balance).to eq(-10)
  end

end
