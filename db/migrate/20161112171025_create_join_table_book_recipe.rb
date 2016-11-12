class CreateJoinTableBookRecipe < ActiveRecord::Migration
  def change
    create_join_table :Books, :Recipes do |t|
      # t.index [:book_id, :recipe_id]
      # t.index [:recipe_id, :book_id]
    end
  end
end
