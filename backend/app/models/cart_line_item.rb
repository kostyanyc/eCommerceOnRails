class CartLineItem < ActiveRecord::Base

	 belongs_to :cart
     belongs_to :variant
  
    def full_price
       unit_price * quantity
    end
   
end
