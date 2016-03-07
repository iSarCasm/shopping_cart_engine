class CartItem
  attr_reader :id
  attr_accessor :quantity

  @product_class  = 'Book'

  def initialize(item_id, quantity = 1)
    @id = item_id
    @quantity = quantity
  end

  # Restoring from Cookies
  def self.restore(hash)
    CartItem.new(hash["id"], hash["quantity"])
  end

  def book
    @@product_class.constantize.find(@id)
  end

  def sum
    book.price * @quantity
  end

  def price
    book.price
  end

  def title
    book.title
  end

  def increase
    @quantity += 1
  end
end
