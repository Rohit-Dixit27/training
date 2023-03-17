Rails.application.routes.draw do
  # get 'index', to: "users#index"
  # get 'about', to:"users#about"

  # namespace :admin do
  #   resources :students
  #  end

  #  scope module: 'admin' do
  #    resources :students
  #  end

   scope '/admin' do
     resources :students
   end
end
