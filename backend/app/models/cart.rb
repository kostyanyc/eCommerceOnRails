class Cart < ActiveRecord::Base

	has_many :cart_line_items

	def total_price
       cart_line_items.to_a.sum(&:full_price)
    end
end
