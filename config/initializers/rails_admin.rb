RailsAdmin.config do |config|


  config.authorize_with :cancan
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.excluded_models  = ["BookOwn", "CategoryBook", "OrderItem", "PaymentInfo", "Address"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
