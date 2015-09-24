class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.references :cart
    	t.string :first_name
    	t.string :last_name
    	t.string :address_1
    	t.string :address_2
    	t.string :city
    	t.string :state
    	t.string :zip    	
        
      t.timestamps null: false
    end
  end
end
