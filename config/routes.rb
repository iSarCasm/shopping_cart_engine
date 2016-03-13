ShoppingCart::Engine.routes.draw do
  resource :carts, only: [:show, :update], path: '/cart' do
    collection do
      post    :add
      delete  :clear
      post    :checkout
    end
  end
end
