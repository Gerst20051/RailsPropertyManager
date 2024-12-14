class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.integer :square_footage
      t.decimal :rent_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
