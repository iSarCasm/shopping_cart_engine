module ShoppingCart::PublicHelper
  def add_cart_button(product, text: "Add to Cart", classes: ['btn', 'btn-primary'], qnt: true, number_class: 'form-control')
    render 'shopping_carts/add',
      locals: {
        product: product,
        classes: classes,
        qnt: qnt,
        number_class: number_class
        text: text
      }
  end
end
