class IngredientsController < ApplicationController

  def index
    @meal = Meal.find(params[:meal_id])
    @ingredients = @meal.ingredients
    @ingredient = Ingredient.new
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    Ingredient.create(ingredient_params[:ingredient])
    redirect_to meal_ingredients_path(params[:meal_id])
  end

  def destroy
    Ingredient.destroy(params[:id])
    redirect_to meal_path(params[:meal_id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    Ingredient.update(params[:id], ingredient_params[:ingredient])
    redirect_to meal_path(params[:meal_id])
  end

  def add_or_remove_list
    i = Ingredient.find(params[:id])
    if i.shopping_list == true
      Ingredient.update(i.id, shopping_list: false)
    else
      Ingredient.update(i.id, shopping_list: true)
    end
    redirect_to list_meals_path
  end

  private

  def ingredient_params
    params.permit(ingredient:[:ingredient_name, :food_group, :shopping_list, :meal_id])

  end

end
