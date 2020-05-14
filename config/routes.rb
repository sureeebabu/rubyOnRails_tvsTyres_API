Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :users, :only => [:index, :show, :create, :update, :delete]
      resources :users, :only => [:index, :show, :create, :update, :destroy, :getdata]
      # get 'users/mymethod'
      # get 'users/index'
      # get 'users/show'
      # get 'users/edit'
      # get 'users/create'
      # get 'users/update'
      # get 'users/delete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
