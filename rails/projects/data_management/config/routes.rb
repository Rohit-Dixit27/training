Rails.application.routes.draw do

  # resources :users do
  #   member do
  #     get 'preview'
  #   end
  # end

  resources :users do
    collection do
      get 'search'
    end
  end
  

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
