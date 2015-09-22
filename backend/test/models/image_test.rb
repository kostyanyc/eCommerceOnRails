require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  
  test "an image should have image title" do
  	image = Image.new
  	
  	#Asserts that validations for image.title (validates :title, presence: true) are present for image saving.
  	assert !image.save
  	assert !image.errors[:title].empty?
  end

test "an image should have image file name" do
  	image = Image.new
  	
  	#Asserts that validations for image.file_name (validates :title, presence: true) are present for image saving.
  	assert !image.save
  	assert !image.errors[:file_name].empty?
  end

  test "an image must have a unique file_name" do
  	image = Image.new  	
  	image = images(:image_one)
  	assert !image.save
  	puts image.errors.inspect
  	assert !image.errors[:file_name].empty?
  	assert image.errors[:file_name].include?("has already been taken")
  end

  test "a second image must have a unique file_name" do
  	image = Image.new  	
  	image = images(:image_two)
  	assert !image.save
  	puts image.errors.inspect
  	assert !image.errors[:file_name].empty?
  	assert image.errors[:file_name].include?("has already been taken")
  end


end
