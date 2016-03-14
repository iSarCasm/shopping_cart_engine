module ShoppingCart
  module ApplicationHelper
    def current_cart
      @_the_shopping_cart ||= ShoppingCart::Cart.new(session)
    end
  end
end
