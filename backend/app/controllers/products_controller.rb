class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy, :admin]

	#before_action :authenticate_user!
	def index
		
  	    @products = Product.all
		
	end

	def show
		
	end

	# GET /products/1/edit
	def edit
		
	end

    # GET /products/new
	def new 
		@product = Product.new
	end

	def create
	   @product = Product.new(product_params)

	    respond_to do |format|
	      if @product.save
	        format.html { redirect_to products_path, notice: 'product was successfully created.' }
	        format.json { render :show, product: :created, location: @product }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, product: :unprocessable_entity }
	      end
	    end
    end

    # PATCH/PUT /products/1
	# PATCH/PUT /products/1.json
	def update
	  respond_to do |format|
	    if @product.update(product_params)
	      format.html { redirect_to products_path, notice: 'product was successfully updated.' }
	      format.json { render :show, product: :ok, location: @product }
	    else
	      format.html { render :edit }
	      format.json { render json: @product.errors, product: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /products/1
	# DELETE /products/1.json
	def destroy
	  @product.destroy
	  respond_to do |format|
	    format.html { redirect_to products_url, notice: 'product was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_id, :title, :slug, :description, :meta_title, :meta_description, :meta_keywords)
    end
end
