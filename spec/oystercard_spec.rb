require 'oystercard'

describe Oystercard do

  let(:oystercard) { Oystercard.new }
  

  it {expect(oystercard).to respond_to(:balance)}


  it "checks that the default balance is 0" do
    expect(oystercard.balance).to eq(0)
  end
  
  it {expect(oystercard).to respond_to(:top_up)}

end