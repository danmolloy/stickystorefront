class AddTypeToCondition < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :type, :string
  end
end
