require 'oystercard'

describe Oystercard do

  let(:oystercard) {Oystercard.new}
  let(:maxbalance) {Oystercard::MAX_BALANCE}
  let(:minamount) {Oystercard::MIN_AMOUNT}
  
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

  # check that in_journey method exists
  it {expect(oystercard).to respond_to(:in_journey?)}

  it "check the default oystercard_status? method returns false. i.e oystercard is not in use" do
    expect(oystercard.in_journey?).to eq(false)
  end

  it {expect(oystercard).to respond_to(:touch_in)}

  it "check if when touch_in is called, in_journey returns true" do
    oystercard.top_up(minamount)
    oystercard.touch_in
    expect(oystercard.in_journey?).to eq true
  end
  
  it {expect(oystercard).to respond_to(:touch_out)}

  it "check if when touch_in and then touch_out is called, in_journey returns false" do
    oystercard.top_up(minamount)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard.in_journey?).to eq false
  end
  
  it "raise error if balance is under 1 on touch in" do
    expect {oystercard.touch_in}.to raise_error "Your balance is less than £#{minamount}."
  end

  it "checks that on touch_out the balance is reduced by the min fare" do
    expect{oystercard.touch_out}.to change{oystercard.balance}.by(- minamount)
  end

end
