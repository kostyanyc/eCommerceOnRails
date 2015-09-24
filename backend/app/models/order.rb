class Order < ActiveRecord::Base
	belongs_to :cart

	 validates :first_name, presence: true
     validates :last_name,  presence: true
     validates :address_1,  presence: true
     validates :address_2,  presence: true
     validates :city,       presence: true
     validates :state,      presence: true
     validates :zip,        presence: true
end
