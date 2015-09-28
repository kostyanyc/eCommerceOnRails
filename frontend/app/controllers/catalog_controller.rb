class CatalogController < ApplicationController
  def index
  	 #Only display primary product elimintating other variants for catalog index
  	 @variants = Variant.where("is_prime = ?", true)
  end
end
