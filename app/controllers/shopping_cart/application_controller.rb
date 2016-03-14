module ShoppingCart
  class ApplicationController < ::ApplicationController
    def current_cart
      @_shopping_cart ||= ShoppingCart::Cart.new(session)
    end
  end
end
