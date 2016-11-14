class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :books
	belongs_to :chef
	has_many :recipes_ingredients
	has_many :ingredients, :through => :recipes_ingredients
	belongs_to :category
	
	accepts_nested_attributes_for :recipes_ingredients
end
