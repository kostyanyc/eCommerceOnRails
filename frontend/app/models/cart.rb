class Cart < ActiveRecord::Base

	has_many :cart_line_items
	has_one :order

	def total_price
       cart_line_items.to_a.sum(&:full_price)
    end
end
