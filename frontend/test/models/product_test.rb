require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "a product should have a title" do
  	product = product.new
  	assert !product.save
  	assert !product.errors[:title].empty?
  end

  test "a product should have a slug" do
  	product = product.new
  	assert !product.save
  	assert !product.errors[:slug].empty?
  end

   test "a product should have a description" do
  	product = product.new
  	assert !product.save
  	assert !product.errors[:description].empty?
  end

  test "a product must have a unique slug" do
  	product = product.new
  	#product.profile_name = products(:konst).profile_name
  	product = products(:product_one)
  	assert !product.save
  	puts product.errors.inspect
  	assert !product.errors[:slug].empty?
  end
end
