module ShoppingCart
  module CartHelper
    def current_cart
      @_the_shopping_cart ||= ShoppingCart::Cart.new(session)
    end

    def add_cart_button(product, text: t('cart.add'), classes: ['btn', 'btn-primary'], qnt: true, number_class: 'form-control')
      render 'shopping_cart/cart/add',
          product: product,
          classes: classes,
          qnt: qnt,
          number_class: number_class,
          text: text
    end

    def cart_icon(icon: 'shopping-cart')
      render 'shopping_cart/cart/icon',
        cart_icon: icon
    end
  end
end
