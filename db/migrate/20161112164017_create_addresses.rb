class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.integer :cep
      t.belongs_to :district, index: true, foreign_key: true
      t.string :address_type

      t.timestamps null: false
    end
  end
end
