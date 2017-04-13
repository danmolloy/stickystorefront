class AddPrizeWonToContestEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :contest_entries, :prize_won, :integer
  end
end
