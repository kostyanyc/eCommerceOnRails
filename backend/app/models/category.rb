class Category < ActiveRecord::Base
	has_many :variants
end
