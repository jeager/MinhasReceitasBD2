class Book < ActiveRecord::Base
  belongs_to :editor
  has_and_belongs_to_many :recipes
  has_many :books_recipes
  has_many :recipes, :through => :books_recipes
  
  accepts_nested_attributes_for :books_recipes
end
