class PublicRecipeController < ApplicationController
  def index
    @recipefoods = RecipeFood.includes(:food).all
    @user = User.all
  end
end
