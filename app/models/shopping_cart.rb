class ShoppingCart
  attr_reader :items

  @session_key = :cart
  @product_class  = ShoppingCart.product_class
  @coupon_class   = ShoppingCart.coupon_class || 'Coupon'

  def initialize(session = {})
    @@session = session
    @items = []
    restore(session[@@session_key])
  end

  def add(product, count = 1)
    product = accept_product_model(product)
    count.times do
      if present?(product)
        find(product).increase
      else
        @items << CartItem.new(product)
      end
    end
  end

  def clear
    @items = []
    @coupon = nil
  end

  def apply_coupon(coupon)
    @coupon = accept_coupon_model(coupon)
  end

  def sum_without_discount
    @items.inject(0) { |sum, item| sum + item.sum }
  end

  def sum
    sum_without_discount * (1 - discount)
  end

  def coupon
    @@coupon_class.constantize.find_by(name: @coupon)
  end

  def size
    @items.inject(0) { |size, item| size + item.quantity }
  end

  def discount_string
    "-#{(coupon.discount*100).to_i}%" if coupon
  end

  def discount
    coupon ? coupon.discount : 0
  end

  def empty?
    size == 0
  end

  def update(id, quantity)
    find(id).quantity = quantity.to_i
  end

  def save
    @@session[@@session_key] = self
  end

  private

  def accept_product_model(model)
    model.is_a?(@@product_class.constantize) ? model.id : model
  end

  def accept_coupon_model(model)
    model.is_a?(@@coupon_class.constantize) ? model.name : model
  end

  def restore(hash)
    return unless @@session[@@session_key]
    hash["items"].each do |item|
      @items << CartItem.restore(item)
    end
    @coupon = hash["coupon"]
  end

  def present?(product_id)
    @items.any? { |item| item.id == product_id }
  end

  def find(product_id)
    @items.find { |item| item.id == product_id }
  end
end
