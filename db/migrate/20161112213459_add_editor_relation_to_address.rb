class AddEditorRelationToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :editor, index: true, foreign_key: true
  end
end
