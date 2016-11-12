class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.belongs_to :taster, index: true, foreign_key: true
      t.belongs_to :recipe, index: true, foreign_key: true
      t.integer :grade
      t.date :evaluation_date
      t.string :comments

      t.timestamps null: false
    end
  end
end
