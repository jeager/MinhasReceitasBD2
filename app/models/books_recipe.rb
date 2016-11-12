class BooksRecipe < ActiveRecord::Base
	belongs_to :book
	belongs_to :recipe
end
