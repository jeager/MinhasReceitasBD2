class Chef < ActiveRecord::Base
  belongs_to :employee
  has_and_belongs_to_many :restaurants
  has_many :recipes

  def most_used_ingredients	
  	RecipesIngredient.joins(:recipe, :ingredient).where('recipes.chef_id' => self.id).group('ingredient_id').limit(10).count.sort_by {|k,v| v}.reverse
  end
end
