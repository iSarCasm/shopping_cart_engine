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
      @@product_class.constantize.find_by_id(@id) || NillCartItemProduct.new
    end

    def sum
      product.price * @quantity
    end

    def id
      product.id
    end

    def price
      product.price
    end

    def title
      product.title
    end

    def increase
      @quantity += 1
    end
  end

  class NillCartItemProduct
    def id
      nil
    end

    def price
      0
    end

    def title
      'nil'
    end
  end
end
