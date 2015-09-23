class Variant < ActiveRecord::Base
	validates :sku, presence: true, uniqueness: true
    validates :price, presence: true

	belongs_to :product
end
