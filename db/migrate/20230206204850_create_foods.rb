class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measuement_unit
      t.integer :price
      t.integer :quantity
      t.references :user, index:true, foreign_key: true
      t.timestamps
    end
  end
end
