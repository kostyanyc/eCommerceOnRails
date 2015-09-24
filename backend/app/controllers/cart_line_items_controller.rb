class CartLineItemsController < ApplicationController
  before_action only: [:create, :destroy]

  def create

  	product_relation = Product.all                             
                              .where(slug: params[:id])
	@variant = Variant.joins(:product).merge(product_relation).first

	@cart_line_item = CartLineItem.where(:cart_id => current_cart.id, :variant_id => @variant.id).first

	if @cart_line_item
		 @cart_line_item.attributes =  {quantity:  params[:quantity].to_i + @cart_line_item.quantity.to_i}
        
        @cart_line_item.save
        #.update_attribute(:only_one_field, "Some Value")

	else
		 @cart_line_item = CartLineItem.create!(:cart_id => current_cart.id, :variant_id => @variant.id, :quantity => params[:quantity], :unit_price => @variant.price)
	end

	
    #@cart_line_item = CartLineItem.create!(:cart_id => current_cart.id, :variant_id => @variant.id, :quantity => params[:quantity], :unit_price => @variant.price)
    flash[:notice] = "Added #{@variant.product.title} to cart."
    redirect_to cart_url(:current)
  end

  def destroy
  	  @cart_line_item = CartLineItem.find(params[:id])
	  @cart_line_item.destroy
	  flash[:notice] = "#{@cart_line_item.variant.product.title} removed from cart."
	  redirect_to cart_url(:current)
	end


end
