class AddRelationToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :employee, index: true, foreign_key: true
    add_reference :addresses, :restaurant, index: true, foreign_key: true
  end
end
