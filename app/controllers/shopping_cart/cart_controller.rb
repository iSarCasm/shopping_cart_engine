module ShoppingCart
  class CartController < ShoppingCart::ApplicationController
    def show
    end

    def add
      current_cart.add(params[:product], params[:quantity].to_i)
      current_cart.save

      respond_to do |format|
        format.js {}
        format.html { redirect_to :back }
      end
    end

    def update
      if params[:coupon] != ""
        current_cart.apply_coupon(params[:coupon])
      end

      if params[:cart_items]
        params[:cart_items].each do |id, qnt|
          current_cart.update(id, qnt[:quantity])
        end
      end

      current_cart.save

      respond_to do |format|
        format.js {}
        format.html { redirect_to :back }
      end
    end

    def clear
      current_cart.clear
      current_cart.save
      redirect_to cart_path
    end
  end
end
