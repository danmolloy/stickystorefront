class CreatePrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :prizes do |t|
      t.integer :stock
      t.string :name

      t.timestamps
    end
  end
end
