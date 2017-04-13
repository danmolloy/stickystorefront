class Condition < ApplicationRecord
  belongs_to :prize
  validates :type, presence: {message: "Must select type of condition"}


end
