class AddColumnToShop < ActiveRecord::Migration[7.2]
  def change
    add_column :shops, :code, :string
  end
end
