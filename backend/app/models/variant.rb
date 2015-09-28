class Variant < ActiveRecord::Base
	validates :sku, presence: true, uniqueness: true
    validates :price, presence: true

	belongs_to :product
	belongs_to :category

end
