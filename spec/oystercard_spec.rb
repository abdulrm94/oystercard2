require 'oystercard'

describe Oystercard do

  let(:oystercard) { Oystercard.new }
  
  it "checks for an existing balance" do
    expect(oystercard).to respond_to(:balance)
  end
end