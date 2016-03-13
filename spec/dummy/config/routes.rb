Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ShoppingCart::Engine => "/cart"
  root 'pages#index'
end
