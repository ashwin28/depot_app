require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  test "add duplicate products to the same cart" do
    cart = Cart.create

    cart.add_product(products(:ruby).id).save
    cart.add_product(products(:ruby).id).save
    total = products(:ruby).price * 2

    assert_equal 1, cart.line_items.size, "size failure"
    assert_equal 2, cart.line_items.first.quantity, "quantity failure"
    assert_equal total, cart.total_price
  end

  test "add unique products to the same cart" do
    cart = Cart.create

    cart.add_product(products(:ruby).id).save
    cart.add_product(products(:coffee).id).save
    total = products(:ruby).price + products(:coffee).price

    assert_equal 2, cart.line_items.size, "size failure"
    assert_equal 1, cart.line_items.first.quantity, "quantity failure"
    assert_equal 1, cart.line_items.last.quantity, "quantity failure"
    assert_equal total, cart.total_price
  end
end
