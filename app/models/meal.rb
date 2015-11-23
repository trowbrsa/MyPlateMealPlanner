class Meal < ActiveRecord::Base
  has_many :ingredients

  DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  MEALS = ["Breakfast", "Lunch", "Dinner"]
end
