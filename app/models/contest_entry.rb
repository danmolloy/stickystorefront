class ContestEntry < ApplicationRecord
  belongs_to :email
  validates_with EntryValidator

  def siblings
    #get collection of entries associated with self's email and remove self from the collection
    self.email.contest_entries.to_a.reject{|entry| entry.id == self.id}
  end

  def date
    self.created_at&.to_date || Date.today
  end
end
