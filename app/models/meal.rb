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

  def needed_food_groups
    needed_groups = ["Grains", "Protein", "Vegetables", "Fruits", "Dairy"]
    have_groups = self.food_groups
    have_groups.map do |group|
      needed_groups.reject! {|g| g == group }
    end
    return needed_groups
  end


  def needed(group)
    have = self.food_groups.include?(group)
    return have ? "selected" : "needed"
  end

  def food_group_count
    self.food_groups.length
  end

end
