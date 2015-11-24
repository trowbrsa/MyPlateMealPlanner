class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    Ingredient.create(ingredient_params[:ingredient])
    redirect_to meal_path(params[:meal_id])
  end

  def destroy
  end


  private

  def ingredient_params
    params.permit(ingredient:[:ingredient_name, :food_group, :shopping_list, :meal_id])

  end

end
