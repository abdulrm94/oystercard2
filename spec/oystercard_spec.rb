require 'oystercard'

describe Oystercard do

  let(:oystercard) {Oystercard.new}
  let(:maxbalance) {Oystercard::MAX_BALANCE}
  
  it {expect(oystercard).to respond_to(:balance)}

  it "checks that the default balance is 0" do
    expect(oystercard.balance).to eq(0)
  end
  
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

  it {expect(oystercard).to respond_to(:top_up)}

  it "raise error if max balance exceeded" do
    expect {oystercard.top_up(1999)}.to raise_error "Max balance of £#{maxbalance} exceeded."
  end
end
