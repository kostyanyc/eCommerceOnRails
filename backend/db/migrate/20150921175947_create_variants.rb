class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku
      t.string :price, :precision => 8, :scale => 2
      t.integer :stock_level
      t.boolean :is_prime
      t.references :product

      t.timestamps null: false
    end
  end
end
