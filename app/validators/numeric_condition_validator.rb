class NumericConditionValidator < ActiveModel::Validator
  def validate(condition)
     if  condition.numbers.any? {|n| n <= 0}
       condition.errors[:base] << "All numbers must be greater than zero!"
     end
  end
end
