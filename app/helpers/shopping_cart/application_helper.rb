module ShoppingCart
  module ApplicationHelper
    def price_without_discount_if_any(obj)
      if obj.sum != obj.sum_without_discount
        number_to_currency obj.sum_without_discount
      end
    end

    def method_missing method, *args, &block
        if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
          if main_app.respond_to?(method)
            main_app.send(method, *args)
          else
            super
          end
        else
          super
        end
      end

      def respond_to?(method)
        if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
          if main_app.respond_to?(method)
            true
          else
            super
          end
        else
          super
        end
      end
  end
end
