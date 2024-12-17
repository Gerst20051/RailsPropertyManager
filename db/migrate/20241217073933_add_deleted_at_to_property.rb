class AddDeletedAtToProperty < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :deleted_at, :datetime
    add_index :properties, :deleted_at
  end
end
