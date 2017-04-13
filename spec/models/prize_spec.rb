require 'rails_helper'

RSpec.describe Prize, :type => :model do
  it "is invalid without a name"
  it "is passed if any conditions are passed"
  it "tries to give from stock if conditions passed"
  it "tries to give from reserves if conditions not passed"
  it "tries to give from reserves if stock empty"
  it "reserves prize instead of giving if entry already has prize"
  it "decreases stock and increases reserves when reserving"
  it "decreases stock if giving from stock"
  it "decreases reserves if giving from reserves"
  it "reports if it has stock left"
  it "reports if it has reserves left"
end
