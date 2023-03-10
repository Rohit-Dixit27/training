Nested Resources
It's common to have resources that are logically children of other resources.

 create paths

     Prefix        Verb   URI Pattern                                                                                       Controller#Action
    inbox_messages     GET    /inboxes/:inbox_id/messages(.:format)                                                             messages#index
                       POST   /inboxes/:inbox_id/messages(.:format)                                                             messages#create
    new_inbox_message  GET    /inboxes/:inbox_id/messages/new(.:format)                                                         messages#new
    edit_inbox_message GET    /inboxes/:inbox_id/messages/:id/edit(.:format)                                                    messages#edit
    inbox_message      GET    /inboxes/:inbox_id/messages/:id(.:format)                                                         messages#show
                       PATCH  /inboxes/:inbox_id/messages/:id(.:format)                                                         messages#update
                       PUT    /inboxes/:inbox_id/messages/:id(.:format)                                                         messages#update
                       DELETE /inboxes/:inbox_id/messages/:id(.:format)                                                         messages#destroy
    inboxes            GET    /inboxes(.:format)                                                                                inboxes#index
                       POST   /inboxes(.:format)                                                                                inboxes#create
    new_inbox          GET    /inboxes/new(.:format)                                                                            inboxes#new
    edit_inbox         GET    /inboxes/:id/edit(.:format)                                                                       inboxes#edit
    inbox              GET    /inboxes/:id(.:format)                                                                            inboxes#show
                       PATCH  /inboxes/:id(.:format)                                                                            inboxes#update
                       PUT    /inboxes/:id(.:format)                                                                            inboxes#update
                       DELETE /inboxes/:id(.:format)                                                                            inboxes#destroy
    root               GET    /                                                                                                 inboxes#index

--------Devise
Devise is a flexible authentication solution for Rails based on Warden. It:

Is Rack based;
Is a complete MVC solution based on Rails engines;
Allows you to have multiple models signed in at the same time;
Is based on a modularity concept: use only what you real.

stpes-
-> gem 'devise'
->bundle
->rails g devise:install
-> config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
-> root 'inboxes#index'
add into layout/application.html.erb
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>

->rails g devise:views
->rails g devise:model
->rails db:migrate


paths generated---

 Prefix Verb                URI Pattern                                                                                    Controller#Action
 new_user_session     GET    /users/sign_in(.:format)                                                                         devise/sessions#new  user_session         POST   /users/sign_in(.:format)                                                                          devise/sessions#create
destroy_user_session  DELETE /users/sign_out(.:format)                                                                    devise/sessions#destroy
new_user_password     GET    /users/password/new(.:format)                                                                     devise/passwords#new
edit_user_password    GET    /users/password/edit(.:format)                                                                    devise/passwords#edit user_password          PATCH  /users/password(.:format)                                                                            devise/passwords#update
                         PUT    /users/password(.:format)                                                                         devise/passwords#update
                         POST   /users/password(.:format)                                                                      devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)                                                                      devise/registrations#cancel
new_user_registration   GET    /users/sign_up(.:format)                                                                          devise/registrations#new
edit_user_registration  GET    /users/edit(.:format)                                                                             devise/registrations#edit
user_registration     PATCH  /users(.:format)                                                                                  devise/registrations#update
                     PUT    /users(.:format)                                                                                  devise/registrations#update
                    DELETE /users(.:format)                                                                                  devise/registrations#destroy
                     POST   /users(.:format)                                                                                  devise/registrations#create

