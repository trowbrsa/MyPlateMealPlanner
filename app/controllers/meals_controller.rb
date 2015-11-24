class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def new
    @title = "Add a Meal"
    @meal = Meal.new
    @action = :create
  end

  def create
    new_meal = Meal.create(meal_params[:meal])
    redirect_to meal_path(new_meal)
  end

  def show
    @meal = Meal.find(params[:id])
    @ingredients = @meal.ingredients
  end

  def edit
    @title = "Edit Meal"
    @meal = Meal.find(params[:id])
    @action = :update
  end

  def update
    Meal.update(params[:id], meal_params[:meal])
    redirect_to meal_path(params[:id])
  end

  def destroy
    Meal.destroy(params[:id])
    redirect_to root_path
  end

  def shopping_list
    @ingredients = Ingredient.all
  end

  private

  def meal_params
    params.permit(meal:[:meal, :day, :meal_name, :description, :food_groups])
  end
end
