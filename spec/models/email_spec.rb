require 'rails_helper'

RSpec.describe Email, :type => :model do

  it "is invalid unless address is present"
  it "is invalid unless address is unique"
  it "is invalid unless address is correct format"
  it "downcases address before creation"


end
