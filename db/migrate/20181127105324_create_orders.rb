class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :quantities, array: true, default: []
      t.timestamps
    end
  end
end
