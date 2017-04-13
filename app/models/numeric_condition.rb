class NumericCondition < Condition
  validates :numbers, presence: {message: "Must enter a value for \"Numbers\" field."}
  validates_with NumericConditionValidator

  def passed_by?(entry)
    numbers.include?(entry.id)
  end
end
