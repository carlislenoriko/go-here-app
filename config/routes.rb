Rails.application.routes.draw do
  
  resources :maps

#     maps GET    /maps(.:format)          maps#index
#          POST   /maps(.:format)          maps#create
#  new_map GET    /maps/new(.:format)      maps#new
# edit_map GET    /maps/:id/edit(.:format) maps#edit
#      map GET    /maps/:id(.:format)      maps#show
#          PATCH  /maps/:id(.:format)      maps#update
#          PUT    /maps/:id(.:format)      maps#update
#          DELETE /maps/:id(.:format)      maps#destroy

end
