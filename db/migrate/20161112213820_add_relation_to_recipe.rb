class AddRelationToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :category, index: true, foreign_key: true
    add_reference :recipes, :chef, index: true, foreign_key: true
  end
end
