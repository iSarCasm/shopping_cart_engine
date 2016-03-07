Rails.application.routes.draw do
  resource :shopping_carts, only: [:show, :update], path: '/cart' do
    collection do
      post    :add
      delete  :clear
      post    :checkout
    end
  end
end
