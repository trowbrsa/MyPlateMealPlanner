class RemoveFoodGroupsFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :food_groups, :integer
  end
end
