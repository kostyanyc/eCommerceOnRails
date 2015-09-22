class ImagesController < ApplicationController
	before_action :set_image, only: [:show, :edit, :update, :destroy]
	#before_action :authenticate_user!
	def index
		@images = Image.all
	end

	def show

	end

	# GET /images/1/edit
	def edit
		
	end

    # GET /images/new
	def new 
		@image = Image.new
	end

	def create
	   @image = Image.new(image_params)

	    respond_to do |format|
	      if @image.save
	        format.html { redirect_to @image, notice: 'Status was successfully created.' }
	        format.json { render :show, image: :created, location: @image }
	      else
	        format.html { render :new }
	        format.json { render json: @image.errors, image: :unprocessable_entity }
	      end
	    end
    end

    # PATCH/PUT /images/1
	# PATCH/PUT /images/1.json
	def update
	  respond_to do |format|
	    if @image.update(image_params)
	      format.html { redirect_to @image, notice: 'Image was successfully updated.' }
	      format.json { render :show, image: :ok, location: @image }
	    else
	      format.html { render :edit }
	      format.json { render json: @image.errors, image: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /images/1
	# DELETE /images/1.json
	def destroy
	  @image.destroy
	  respond_to do |format|
	    format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:file_name, :title, :description, :asset)
    end
end
