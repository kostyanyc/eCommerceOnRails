require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  test "a variant should enter a sku" do
  	variant = Variant.new
  	assert !variant.save
  	assert !variant.errors[:sku].empty?
  end

  test "a variant should enter a price" do
  	variant = Variant.new
  	assert !variant.save
  	assert !variant.errors[:price].empty?
  end
  test "a variant must have a unique slug" do
  	product = product.new
  	#product.profile_name = products(:konst).profile_name
  	product = products(:product_one)
  	assert !product.save
  	puts product.errors.inspect
  	assert !product.errors[:slug].empty?
  end
  test "a variant must have a unique sku" do
  	product = product.new
  	#product.profile_name = products(:konst).profile_name
  	product = products(:product_one)
  	assert !product.save
  	puts product.errors.inspect
  	assert !product.errors[:slug].empty?
  end
end
