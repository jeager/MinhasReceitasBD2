class City < ActiveRecord::Base
  belongs_to :uf
  has_many :districts
end
