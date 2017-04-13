class NumericConditionValidator < ActiveModel::Validator
  def validate(condition)
     if  condition.numbers.any? {|n| n <= 0}
       condition.errors[:base] << "Input must be a space-separated list of positive numbers."
     end
  end
end
