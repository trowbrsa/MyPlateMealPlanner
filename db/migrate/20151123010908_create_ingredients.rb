class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.string :food_group
      t.boolean :shopping_list
      t.integer :meal_id

      t.timestamps null: false
    end
  end
end
