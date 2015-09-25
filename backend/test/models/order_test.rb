require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   test "an order should have a first name" do
  	order = Order.new
  	assert !order.save
  	assert !order.errors[:first_name].empty?
  end

  test "an order should have a last name" do
  	order = Order.new
  	assert !order.save
  	assert !order.errors[:last_name].empty?
  end
end
