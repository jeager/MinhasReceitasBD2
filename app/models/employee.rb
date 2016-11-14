class Employee < ActiveRecord::Base
	has_one :taster
	has_one :chef
	has_many :addresses

	accepts_nested_attributes_for :addresses
end
