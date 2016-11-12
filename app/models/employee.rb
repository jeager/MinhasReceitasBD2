class Employee < ActiveRecord::Base
	has_many :tasters
	has_many :chefs
	has_many :addresses

	accepts_nested_attributes_for :addresses
end
