class CreateContestEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :contest_entries do |t|
      t.belongs_to :email, index: true

      t.timestamps
    end
  end
end
