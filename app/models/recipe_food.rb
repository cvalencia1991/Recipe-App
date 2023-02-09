class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def inc_food_items
    Food.all.length
  end
end
