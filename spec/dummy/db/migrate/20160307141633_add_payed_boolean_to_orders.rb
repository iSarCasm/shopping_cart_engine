class AddPayedBooleanToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payed, :boolean
  end
end
