require 'rails/generators/base'

module ShoppingCart
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_initializer
      copy_file "initializer.rb", "config/initializers/shopping_cart.rb"
    end

    def copy_controller
      copy_file "carts_controller.rb", "app/controllers/shopping_cart/checkout_controller.rb"
    end

    def copy_locale
      copy_file "../../../../../config/locales/en.yml", "config/locales/shopping_cart.en.yml"
    end
  end
end
