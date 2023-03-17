

----->singular resource
get 'about', to: 'students#about'

url - > /about
controller-action - > students#about

----->resources creates seven routes
[index, new, create, show, edit, update, destroy]
resources :students


----->Controller namespace and routing
 ->to organize groups of controllers under a namespace. 
 ->create a directory admin inside it create a controller students then,

 routes
 namespace :admin do
   resources :students
 end

 Then,
 url -> /admin/students
 controller_action -> /admin/students#index
------------------------------------------
 [if we dont want /admin in url then use module scope]
  scope module: 'admin' do
    resources :students
  end

  Then,
 url -> /students
 controller_action -> /admin/students#index
------------------------------------------
[if we want to route /admin/students to StudentsController (without the Admin:: module prefix), then use a scope block:]

scope '/admin' do
  resources :students
end

url -> /admin/students
controller_action -> students#index

------>Nesting Resources
resources that are logically children of other resources.
so, routes ->
 resources :users do
    resources :posts
  end

url - > /users/:user_id/posts/:id/edit
controller_action -> posts#edit

[Resources should never be nested more than 1 level deep.]

-------->shallow nesting
create collection(index, new and create) under the parent only.

resources :users do
    resources :posts, shallow: true
  end

url_for_new_posts,create and index need user_id.
and
url_for edit, update, show and destroy dont need user_id.

------------There exist two options for scope to customize shallow routes. :shallow_path prefixes member paths with the specified parameter:
->shallow_path
scope shallow_path: 'data' do
     resources :users do
       resources :posts, shallow: true
     end
   end

   [url -> /data/posts/:id/edit]

->shallow_prefix
The :shallow_prefix option adds the specified parameter to the named route helpers:
scope shallow_prefix: 'data' do
    resources :users do
      resources :posts, shallow: true
    end
  end

  path - > edit_data_post