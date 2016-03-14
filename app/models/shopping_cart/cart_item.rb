module ShoppingCart
  class CartItem
    attr_reader :id
    attr_accessor :quantity

    @@product_class  =  ShoppingCart.product_class

    def initialize(item_id, quantity = 1)
      @id = item_id
      @quantity = quantity
    end

    # Restoring from Cookies
    def self.restore(hash)
      CartItem.new(hash["id"], hash["quantity"])
    end

    def product
      @@product_class.constantize.find_by_id(@id)
    end

    def sum
      product.price * @quantity if product
    end

    def id
      product.id if product
    end

    def price
      product.price if product
    end

    def title
      product.title if product
    end

    def increase
      @quantity += 1
    end
  end
end
