class Prize < ApplicationRecord
  has_many :conditions, dependent: :destroy
  validates :name, presence: true

  def request_for(entry)
    conditions_passed_by?(entry) ? try_stock(entry) : try_reserves(entry)
  end

  def try_stock(entry)
    return try_reserves(entry) unless have_stock?
    if entry.has_prize?
      reserve_prize
      return false
    else
      give_prize_from_stock
    end
  end

  def try_reserves(entry)
    return false unless have_reserves?
    entry.has_prize? ? false : give_prize_from_reserves
  end

  def have_stock?
    self.stock && self.stock > 0
  end

  def have_reserves?
    self.reserves && self.reserves > 0
  end

  def give_prize_from_stock
    self.decrement!(:stock)
  end

  def give_prize_from_reserves
    self.decrement!(:reserves)
  end

  def reserve_prize
    self.decrement!(:stock)
    self.increment!(:reserves)
  end

  def conditions_passed_by?(entry)
    self.conditions.any? {|condition| condition.passed_by?(entry)}
  end
end
