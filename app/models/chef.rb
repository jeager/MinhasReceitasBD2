class Chef < ActiveRecord::Base
  belongs_to :employee
  has_and_belongs_to_many :restaurants
  has_and_belongs_to_many :recipes
end
