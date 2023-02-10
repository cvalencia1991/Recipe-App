class PublicRecipeController < ApplicationController
  def index
    @user = User.includes(:foods).all
  end
end
