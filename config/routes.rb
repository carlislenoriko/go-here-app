Rails.application.routes.draw do
  
  resources :users, except: :index
#     users POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
  
  resources :pins, except: :index
 #     pins POST   /pins(.:format)           pins#create
 #  new_pin GET    /pins/new(.:format)       pins#new
 # edit_pin GET    /pins/:id/edit(.:format)  pins#edit
 #      pin GET    /pins/:id(.:format)       pins#show
 #          PATCH  /pins/:id(.:format)       pins#update
 #          PUT    /pins/:id(.:format)       pins#update
 #          DELETE /pins/:id(.:format)       pins#destroy

  resources :maps
#     maps GET    /maps(.:format)          maps#index
#          POST   /maps(.:format)          maps#create
#  new_map GET    /maps/new(.:format)      maps#new
# edit_map GET    /maps/:id/edit(.:format) maps#edit
#      map GET    /maps/:id(.:format)      maps#show
#          PATCH  /maps/:id(.:format)      maps#update
#          PUT    /maps/:id(.:format)      maps#update
#          DELETE /maps/:id(.:format)      maps#destroy

  resources :categories, only: [:index, :show]
  # categories GET    /categories(.:format)     categories#index
  # category   GET    /categories/:id(.:format) categories#show
end
