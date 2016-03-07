require "shopping_cart/engine"

module ShoppingCart
  mattr_accessor :product_class
  mattr_accessor :coupon_class

  mattr_accessor :with_coupons

  def self.setup(&block)
    yield self
  end
end
