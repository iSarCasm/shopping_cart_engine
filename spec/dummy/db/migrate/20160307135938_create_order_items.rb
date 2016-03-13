class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :pizza
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
