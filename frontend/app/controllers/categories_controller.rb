class CategoriesController < ApplicationController
   def index
		 #Only display primary product elimintating other variants for catalog index
  	    @variants = Variant.where("is_prime = ?", true)
  	    @categories = Category.all
		
	end

	def show
		 @categories = Category.all
		 #TODO: add index to slug
		  category_relation = Category.all                             
                              .where(slug: params[:id])
		 @variants = Variant.joins(:category).merge(category_relation)
		
	end
end
