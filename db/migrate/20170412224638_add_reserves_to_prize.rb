class AddReservesToPrize < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :reserves, :integer
  end
end
