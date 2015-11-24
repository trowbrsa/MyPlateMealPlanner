class Ingredient < ActiveRecord::Base
  belongs_to :meal

  FOODGROUPS = ["Grains", "Protein", "Vegetables", "Fruits", "Dairy"]
end
