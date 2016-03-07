require "shopping_cart/engine"

module ShoppingCart
  mattr_accessor :product_class
  mattr_accessor :coupon_class

  mattr_accessor :with_coupons

  class Engine < Rails::Engine
    initializer "my_engine.configure_rails_initialization" do |app|
    end
  end

  # This is what I was trying to figure out
  def self.config(&block)
    yield @@config if block
    return @@config
  end
end
