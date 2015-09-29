class CartLineItemsController < ApplicationController
	 before_action only: [:create, :destroy]

  def create

  	product_relation = Product.all                             
                              .where(slug: params[:id])
	@variant = Variant.joins(:product).merge(product_relation).first

	@cart_line_item = CartLineItem.where(:cart_id => current_cart.id, :variant_id => @variant.id).first
	
	if @cart_line_item
		@cart_stock = @cart_line_item.quantity.to_i + params[:quantity].to_i
	else
		@cart_stock = params[:quantity].to_i
	end

	if @variant.stock_level.to_i < @cart_stock.to_i
		if @cart_line_item 
			flash[:alert] = "#{@cart_line_item.variant.product.title} cannot be added to the cart. Please add less then or equal to #{@variant.stock_level - @cart_line_item.quantity.to_i}  items"
		else
			flash[:alert] = "Item cannot be added to the cart. Please add less then or equal to #{@variant.stock_level}  items"
		end

		redirect_to product_path(@variant.product)
	else
		if @cart_line_item
			 @cart_line_item.attributes =  {quantity:  params[:quantity].to_i + @cart_line_item.quantity.to_i}
	        
	        @cart_line_item.save
	       
		else
			 @cart_line_item = CartLineItem.create!(:cart_id => current_cart.id, :variant_id => @variant.id, :quantity => params[:quantity], :unit_price => @variant.price)
		end
	
	
    #@cart_line_item = CartLineItem.create!(:cart_id => current_cart.id, :variant_id => @variant.id, :quantity => params[:quantity], :unit_price => @variant.price)
    flash[:notice] = "Added #{@variant.product.title} to cart."
    redirect_to cart_url(:current)
    end
  end

  def destroy
  	  @cart_line_item = CartLineItem.find(params[:id])
	  @cart_line_item.destroy
	  flash[:notice] = "#{@cart_line_item.variant.product.title} removed from cart."
	  redirect_to cart_url(:current)
  end
end
