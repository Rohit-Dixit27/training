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

