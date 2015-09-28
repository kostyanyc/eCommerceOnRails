class OrdersController < ApplicationController
	def create
  	@cart = current_cart
    @order = Order.new(order_params)  
    @order.cart_id = current_cart.id     
    session[:cart_id] = nil 

    if @order.save  
      render :action => "success"
      	@order.cart.cart_line_items.each do |cart_line_item|      		
		 	@variant = Variant.all.where(id: cart_line_item.variant_id).first
      		@variant.stock_level = @variant.stock_level.to_i - cart_line_item.quantity.to_i
      		@variant.save
  		end
    else
      render :action => "failure"
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @cart = current_cart
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

   def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def order_params
      params.require(:order).permit(:cart_id, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip)
    end
end
