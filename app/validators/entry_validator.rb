class EntryValidator < ActiveModel::Validator
  def validate(entry)
    #check if any of the other entries associated with our email were created on the same day as us
     if entry.siblings.any? {|sibling| sibling.date == entry.date }
       entry.errors[:base] << "This email address has already entered the contest today."
     end
  end
end
