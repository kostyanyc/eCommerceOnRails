class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	#before_action :authenticate_user!
	def index
		@categories = Category.all
	end

	def show

	end

	# GET /categorys/1/edit
	def edit
		
	end

    # GET /categorys/new
	def new 
		@category = Category.new
	end

	def create
	   @category = Category.new(category_params)

	    respond_to do |format|
	      if @category.save
	        format.html { redirect_to categories_path, notice: 'category was successfully created.' }
	        format.json { render :show, category: :created, location: @category }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, category: :unprocessable_entity }
	      end
	    end
    end

    # PATCH/PUT /categorys/1
	# PATCH/PUT /categorys/1.json
	def update
	  respond_to do |format|
	    if @category.update(category_params)
	      format.html { redirect_to categories_path, notice: 'category was successfully updated.' }
	      format.json { render :show, category: :ok, location: @category }
	    else
	      format.html { render :edit }
	      format.json { render json: @category.errors, category: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /categorys/1
	# DELETE /categorys/1.json
	def destroy
	  @category.destroy
	  respond_to do |format|
	    format.html { redirect_to categorys_url, notice: 'category was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:parent_id, :title, :slug, :description, :sort_order, :meta_title, :meta_description, :meta_keywords)
    end
end
