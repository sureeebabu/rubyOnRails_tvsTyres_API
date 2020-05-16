Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tests/mymethod'
      get 'tests/getdatabyid/:id', to: 'tests#getdatabyid'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'userdetails/index'
    end
  end
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, :only => [:index, :show, :create, :update, :destroy]      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
