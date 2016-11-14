class Restaurant < ActiveRecord::Base
	has_and_belongs_to_many :chefs
	has_many :addresses

	accepts_nested_attributes_for :addresses
end
