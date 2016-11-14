Rails.application.routes.draw do



  get 'rawtexts/index'

  get 'rawtexts/new'

  get 'rawtexts/create'

  get 'rawtexts/destroy'

  resources :rawtexts, only: [:index, :new, :create, :destroy]
  root "rawtexts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
