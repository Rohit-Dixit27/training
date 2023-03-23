->import an excel file.

->this is used roo gem.

->used delayed_job gem
 using delayed jobs what we can do is we can execute the processes in the background and user wont have to wait till all the processes are completed. 
 

->install redis server
sudo apt install redis-server

--------------------------------------------------------------------------------------------------------

install sidekiq
-> gem 'sidekiq'

-->Sidekiq is a framework for background job processing that is very useful for handling expensive computation, emails, and other processes that is better served outside of the main web application.

->run [bundle exec sidekiq.]