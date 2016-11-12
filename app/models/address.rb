class Address < ActiveRecord::Base
  belongs_to :district
  belongs_to :employee
  belongs_to :restaurant
end
