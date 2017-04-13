class MultipleCondition < Condition
  validates :multiple_of, presence: {message: "Must enter a value for \"Multiples Of\" field."}
  validates_with MultipleConditionValidator

  def passed_by?(entry)
    return false if after  && entry.id <= after
    return false if before && entry.id >= before
    entry.id % multiple_of == 0 ? true : false
  end

end
