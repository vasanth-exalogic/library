class AddRenewedToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :renewed, :boolean, :default => false
  end
end
