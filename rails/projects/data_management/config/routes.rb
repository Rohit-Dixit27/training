Rails.application.routes.draw do

  root 'users#index'
  direct :rails do
    "https://rubyonrails.org"
  end
  # get 'show', to: redirect('index')
  # get 'index', to: 'users#index'
  # get 'show/:id/*other', to: 'users#show'
  #get 'show/:id', to: 'users#show', constraints: {id: /[a-z]/} 
  # match 'show', to: 'users#show', via: [:get, :post]
  # get 'show', to: 'users#show', as: :display
  # resources :users do
  #   member do
  #     get 'preview'
  #   end
  # end

  # resources :users do
  #   collection do
  #     get 'search'
  #   end
  # end
  

  # get 'index', to: 'posts#index'

  # resources :users do
  #   resources :posts
  # end

  # resources :users do
  #   resources :posts, shallow: true
  # end

  #  scope shallow_path: 'data' do
  #    resources :users do
  #      resources :posts, shallow: true
  #    end
  #  end

  # concern :images do
  #   resources :posts
  # end

  # resources :users, concerns: :images

  # scope shallow_prefix: 'data' do
  #   resources :users do
  #     resources :posts, shallow: true
  #   end
  # end

  # get 'index', to: "users#index"
  # get 'about', to:"users#about"

  # namespace :admin do
  #   resources :students
  #  end

  #  scope module: 'admin' do
  #    resources :students
  #  end

  #  scope '/admin' do
  #    resources :students
  #  end
end
