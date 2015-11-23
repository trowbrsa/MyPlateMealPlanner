class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :meal
      t.string :day
      t.string :meal_name
      t.string :description
      t.integer :food_groups

      t.timestamps null: false
    end
  end
end
