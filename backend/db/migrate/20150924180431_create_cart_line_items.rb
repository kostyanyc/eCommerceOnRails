class CreateCartLineItems < ActiveRecord::Migration
  def change
    create_table :cart_line_items do |t|
    	t.references :cart
    	t.references :variant
        t.decimal :unit_price, :precision => 8, :scale => 2
        t.integer :quantity

        t.timestamps null: false
    end
  end
end
