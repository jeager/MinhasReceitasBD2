class Evaluation < ActiveRecord::Base
  belongs_to :taster
  belongs_to :recipe
end
