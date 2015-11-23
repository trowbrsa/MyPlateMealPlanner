class MealsController < ApplicationController

  def index
  end

  def new
    @title = "Add a Meal"
    @meal = Meal.new
    @action = :create
  end
end
