class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :subtotal
      t.float :total
      t.float :shipping
      t.boolean :sent
      t.boolean :complete

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
