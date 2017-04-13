class RenameSpecificNumbersToNumbersOnCondition < ActiveRecord::Migration[5.1]
  def change
    rename_column :conditions, :specific_numbers, :numbers
  end
end
