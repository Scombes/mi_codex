class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :copyright
      t.string :genre
      t.string :isbn
      t.integer :user_id

      t.timestamps
    end
    add_index :books, [:user_id]
  end
end
