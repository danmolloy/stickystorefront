require 'rails_helper'

RSpec.describe NumericCondition, :type => :model do
  before do
    @prize = Prize.create(name: 'test_prize')
    @email = Email.create(address: 'rspec@test.com')
    @entry = ContestEntry.create(email: @email)
  end
  it "is invalid without numbers" do
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition')).to be_invalid
  end

  it "is invalid with non-positive numbers" do
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition', numbers: [0, 1, 2])).to be_invalid
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition', numbers: [-1, -2] )).to be_invalid
  end
  it "is valid with positive numbers" do
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition', numbers: [1, 2] )).to be_valid
  end

  it "is passed by a number in its numbers collection" do
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition',
     numbers: [@entry.id] ).passed_by?(@entry)).to be(true)
  end

  it "is not passed by a number outside its numbers collection" do
    expect(Condition.new(prize_id: @prize.id, type: 'NumericCondition',
     numbers: [@entry.id+1] ).passed_by?(@entry)).to be(false)
  end
end
