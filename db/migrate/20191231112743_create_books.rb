class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.text :title
      t.text :description
      t.string :author
      t.integer :count

      t.timestamps
    end
  end
end
