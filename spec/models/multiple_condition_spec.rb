require 'rails_helper'

RSpec.describe MultipleCondition, :type => :model do
  before do
    @prize = Prize.create(name: 'test_prize')
  end
  it "is invalid without a multiple" do
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition')).to be_invalid
  end

  it "is invalid with non-positive multiple" do
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 0)).to be_invalid
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: -1)).to be_invalid
  end
  it "is invalid with non-positive before" do
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, before: 0)).to be_invalid
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, before: -1)).to be_invalid
  end
  it "is invalid with negative after" do
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, after: -1)).to be_invalid
  end

  it "is valid with positive numbers" do
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, after: 0)).to be_valid
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, after: 1)).to be_valid
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1, before: 1)).to be_valid
    expect(Condition.new(prize_id: @prize.id, type: 'MultipleCondition',
      multiple_of: 1)).to be_valid
  end

  it "is not passed by a number smaller than after"
  it "is not passed by a number greater than before"
  it "is not passed by a number that is not a multiple"
  it "is passed by a number that is a multiple"
end
