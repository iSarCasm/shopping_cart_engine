module ShoppingCart
  class ApplicationController < ActionController::Base
    def current_cart
      @_shopping_cart ||= ShoppingCart::Cart.new(session)
    end
    helper_method :current_cart
  end
end
