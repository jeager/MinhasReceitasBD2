class CreateJoinTableRecipeChef < ActiveRecord::Migration
  def change
    create_join_table :Recipes, :Chefs do |t|
      # t.index [:recipe_id, :chef_id]
      # t.index [:chef_id, :recipe_id]
    end
  end
end
