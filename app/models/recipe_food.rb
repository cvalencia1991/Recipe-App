class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id'
  belongs_to :food,class_name: 'Food', foreign_key: 'food_id'

  def inc_food_items
    Food.all.length
  end
end
