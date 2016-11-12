class AddFieldToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :uf, index: true, foreign_key: true
  end
end
