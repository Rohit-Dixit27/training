

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

