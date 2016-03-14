ShoppingCart::Engine.routes.draw do
    get     "/",       to: 'cart#show',    as: 'cart'
    post    "/",       to: 'cart#update'
    put     "/",       to: 'cart#update'
    post    "/add",      to: 'cart#add',     as: 'add'
    delete  "/clear",    to: 'cart#clear',   as: 'clear'

    post    "/checkout", to: 'checkout#checkout', as: 'checkout'
end
