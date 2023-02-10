class PublicRecipeController < ApplicationController
  def index
    @user = User.includes(:foods)
  end

  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
