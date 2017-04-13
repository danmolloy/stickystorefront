class ContestEntry < ApplicationRecord
  belongs_to :email
  validates :email_id, presence: {message: "Invalid email"}
  validates_with EntryValidator

  def siblings
    #get collection of entries associated with self's email and remove self from the collection
    return nil unless self.email
    self.email.contest_entries.to_a.reject{|entry| entry.id == self.id}
  end

  def date
    self.created_at&.to_date || Date.today
  end

  def has_prize?
    self.prize_won.present?
  end

  def ask_for_prizes
    prizes = Prize.all.sort_by { |prize| prize.created_at} #spec says prizes should be won in order of cdate when conflicts occur
    prizes.each do |prize|
      if prize.request_for(self)
        self.prize_won = prize.id
        self.save(validate: false)
      end
    end
  end

end
