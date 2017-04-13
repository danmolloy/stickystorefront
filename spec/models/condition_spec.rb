require 'rails_helper'

RSpec.describe Condition, :type => :model do
  before do
    @prize = Prize.create(name: 'test_prize')
  end
  it "is invalid without a type" do
    expect(Condition.new(prize_id: @prize.id)).to be_invalid
  end

  it "is invalid without a prize" do
    expect(Condition.new(type: 'NumericCondition', numbers: [1, 2])).to be_invalid
  end
end
