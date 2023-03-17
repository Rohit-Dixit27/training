Rails.application.routes.draw do

  # get 'index', to: 'posts#index'

  # resources :users do
  #   resources :posts
  # end

  # resources :users do
  #   resources :posts, shallow: true
  # end

   scope shallow_path: 'data' do
     resources :users do
       resources :posts, shallow: true
     end
   end

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
