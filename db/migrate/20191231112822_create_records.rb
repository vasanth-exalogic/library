class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :book_id
      t.date :due_date

      t.timestamps
    end
  end
end
