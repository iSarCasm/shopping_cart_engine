module ShoppingCart
  class ApplicationController < ::ApplicationController
    include MyApp::Engine.routes.url_helpers

    def current_cart
      @_shopping_cart ||= ShoppingCart::Cart.new(session)
    end
  end
end
