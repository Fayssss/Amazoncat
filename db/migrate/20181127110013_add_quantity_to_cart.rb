class AddQuantityToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :quantities, :string, array: true, default: []
  end
end
