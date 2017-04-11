class Email < ApplicationRecord
  has_many :contest_entries
  validates :address, presence: true, uniqueness: true,
    format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
             message: "Invalid email address"} #http://emailregex.com/
  before_create :normalize_address

  def normalize_address
    self.address.downcase!
  end
end
