class Meal < ActiveRecord::Base
  has_many :ingredients

  DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  MEALS = ["Breakfast", "Lunch", "Dinner"]

  def food_groups
    food_group_array = self.ingredients.map do |i|
      i.food_group
    end
    food_group_array.uniq!
    food_group_array.reject! {|i| i == ""}
    return food_group_array
  end


  def needed(group)
    have = self.food_groups.include?(group)
    return have ? "selected" : "needed"
  end

  def food_group_count
    self.food_groups.length
  end

end
