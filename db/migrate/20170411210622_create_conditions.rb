class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.belongs_to :prize, index: true
      t.integer :specific_numbers, array: true
      t.integer :after
      t.integer :before
      t.integer :multiple_of

      t.timestamps
    end
  end
end
