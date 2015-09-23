class VariantsController < ApplicationController
	before_action :set_variant, only: [:show, :edit, :update, :destroy]
	#before_action :authenticate_user!
	def index
		@variants = Variant.all
	end

	def show

	end

	# GET /variants/1/edit
	def edit
		
	end

    # GET /variants/new
	def new 
		@variant = Variant.new
	end

	def create
	   @variant = Variant.new(variant_params)

	    respond_to do |format|
	      if @variant.save
	        format.html { redirect_to @variant, notice: 'Status was successfully created.' }
	        format.json { render :show, variant: :created, location: @variant }
	      else
	        format.html { render :new }
	        format.json { render json: @variant.errors, variant: :unprocessable_entity }
	      end
	    end
    end

    # PATCH/PUT /variants/1
	# PATCH/PUT /variants/1.json
	def update
	  respond_to do |format|
	    if @variant.update(variant_params)
	      format.html { redirect_to @variant, notice: 'variant was successfully updated.' }
	      format.json { render :show, variant: :ok, location: @variant }
	    else
	      format.html { render :edit }
	      format.json { render json: @variant.errors, variant: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /variants/1
	# DELETE /variants/1.json
	def destroy
	  @variant.destroy
	  respond_to do |format|
	    format.html { redirect_to variants_url, notice: 'variant was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_params
      params.require(:variant).permit(:product_id, :sku, :price, :stock_level, :is_prime,)
    end
end
