class CreateJoinTableChefRestaurant < ActiveRecord::Migration
  def change
    create_join_table :Chefs, :Restaurants do |t|
      # t.index [:chef_id, :restaurant_id]
      # t.index [:restaurant_id, :chef_id]
    end
  end
end
