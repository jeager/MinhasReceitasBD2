class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
