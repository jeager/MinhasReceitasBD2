class Address < ActiveRecord::Base
  belongs_to :district
  belongs_to :employee
  belongs_to :restaurant

  accepts_nested_attributes_for :district
end
