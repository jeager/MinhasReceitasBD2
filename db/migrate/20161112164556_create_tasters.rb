class CreateTasters < ActiveRecord::Migration
  def change
    create_table :tasters do |t|
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
