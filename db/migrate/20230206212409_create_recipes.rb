class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :description
      t.boolean :public
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
    add_index :recipes, :name

  end
end
