class Meal < ActiveRecord::Base
  has_many :ingredients

  DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  MEALS = ["Breakfast", "Lunch", "Dinner"]

  def self.food_groups(meal)
    food_group_array = meal.ingredients.map do |i|
      i.food_group
    end
    food_group_array.uniq!
    food_group_array.reject! {|i| i == ""}
    return food_group_array
  end

  def self.food_group_count(meal)
    Meal.food_groups(meal).length
  end

end
