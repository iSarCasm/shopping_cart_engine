module ShoppingCart
  module CartHelper
    def current_cart
      @_the_shopping_cart ||= ShoppingCart::Cart.new(session)
    end

    def add_cart_button(product, text: "Add to Cart", classes: ['btn', 'btn-primary'], qnt: true, number_class: 'form-control')
      render 'shopping_cart/cart/add',
          product: product,
          classes: classes,
          qnt: qnt,
          number_class: number_class,
          text: text
    end
  end
end
