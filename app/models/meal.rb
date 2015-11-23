class Meal < ActiveRecord::Base
  has_many :ingredients
end
