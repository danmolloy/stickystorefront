class MultipleConditionValidator < ActiveModel::Validator
  def validate(condition)
     if condition.multiple_of <= 0
       condition.errors[:base] << "\"Multiple of\" must be greater than zero!"
     end
     if condition.after && condition.after < 0
       condition.errors[:base] << "\"After\" must not be negative!"
     end
     if condition.before && condition.before <= 0
       condition.errors[:base] << "\"Before\" must be greater than zero!"
     end
  end
end
