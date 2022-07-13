Rails.application.routes.draw do
  
  get 'images/index'
  root 'images#index'
  
  get 'images/new'
  get 'get_image/:id', to: 'images#get_image'
  post 'images', to: 'images#create' #creatメソッドはリダイレクトする 
  delete 'images/:id', to: 'images#destroy'
  get 'images/:id', to: 'images#show'
  get 'images/:id/edit', to: 'images#edit'
  patch 'images/:id', to: 'images#update'
  
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
