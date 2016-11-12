class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :rg
      t.integer :enrollment
      t.string :sex
      t.float :salary
      t.integer :cpf
      t.string :nationality
      t.string :scholarity
      t.string :father_name
      t.string :mother_name

      t.timestamps null: false
    end
  end
end
