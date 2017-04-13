require 'rails_helper'

RSpec.describe ContestEntry, :type => :model do

  it "is invalid without a valid email"
  it "returns siblings without including itself"
  it "accurately reports if it has won a prize"
  it "asks for prizes in order of their creation date"
  it "updates prize_won if it has won a prize"

end
