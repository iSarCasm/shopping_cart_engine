# ShoppingCart
Shopping Cart gem provides the VERY BASIC functionality of cookie-shopping-cart.

## Installation 
1. Add Gem to your Gemfile:
  ```ruby
  gem 'shopping_cart', git: 'https://github.com/iSarCasm/shopping_cart_engine'
  ```
  And do not forget run `bundle install`.

2. Run `rails generate shopping_cart:install`

3. Mount Routes in your `config/routes.rb`:
  ```ruby
    mount ShoppingCart::Engine => "/cart"
  ```

4. Customize the `config/initializers/shopping_cart.rb` which looks like this:
  ```ruby
  ShoppingCart.setup do |config|
    config.product_class  = 'Product'
    config.coupon_class   = 'Coupon'
    config.with_coupons   = true
  end
  ```
  Where 
    1. `product_class` is class of your website's products which would be stored in shopping cart.
    2. `coupon_class` class of your coupons which may hold discounts and etc.
    3. `with_coupons` indicates whether your site is even using any coupons.
  
5. Customize your checkout action. Go to `app/controller/shopping_cart/checkout_controller.rb` and change `#checkout` action as you wish. This is called when user clicks `checkout` button. 
  *REMINDER*: if you trying to use your's app routes do it like this: `main_app.root_path` instead of `root_path`!

## Very Simple Requirements
1. Product
  * - has to `respond_to`: `id`, `price`, `title`
2. Coupon
  * - has to `respond_to`: `discount`, `name`
  
## Helper methods
The functionality is very simple. 
### current_cart
That method is available in your views and controllers which inherit from `ShoppingCart:ActionController`
Returns the current cart of user. `current_cart` responds to:
  * `add(product, count = 1)`
  * `clear`
  * `apply_coupon(coupon)`
  * `sum_without_discount`
  * `sum` - with discount
  * `coupon` - returns Model
  * `size` - number of total items
  * `discount_string` - string of type: `37%`
  * `discount` - float
  * `empty?`
  * `update(id, quantity)` - updates number of items for given product
  * `save` - saves all changes to cookies. Has to be called after each change
  
### add_cart_button(product, options={})
Renders a button for adding a given product.
  * `:text:` - default is t('cart.add')
  * `:classes` - css button classes
  * `:qnt` -  true, false - no number selection
  * `:number_class` - number selection class. Default is: 'form-control'

Example:
```ruby
.col-xs-3
  %img{src: book.image_url(:small)}
.col-xs-9
  %strong
    %a{href: book_path(book)}= book.title
  %p= truncate(book.desc, length: 100, separator: ' ')
  %p= number_to_currency(book.price)
  =add_cart_button book, text: t('cart.add')
```

### cart_icon(options={})
Can be used in the header. Tells the current status of the cart + link to the cart page.
  * `:icon` - icon class. Default if `'shopping-cart'`

## Routes
You can use those anywhere in your app:
  1. `shopping_cart.cart_path` (get - #show, put/post - #update)
  2. `shopping_cart.add_path` (post)
  3. `shopping_cart.clear_path` (delete)
  4. `shopping_cart.chechout_path` (post) 

## Contributing
rofl
