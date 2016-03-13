class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :title
      t.decimal :price
      t.text :desc

      t.timestamps null: false
    end
  end
end
