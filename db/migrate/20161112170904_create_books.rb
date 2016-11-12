class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.belongs_to :editor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
