--->Session
-Application has a session for each user in which you can store small amounts of data that will be persisted between requests. 
-The session is only available in the controller and the view and can use one of several of different storage mechanisms:

ActionDispatch::Session::CookieStore - Stores everything on the client.
ActionDispatch::Session::CacheStore - Stores the data in the Rails cache.
ActionDispatch::Session::ActiveRecordStore - Stores the data in a database using Active Record (requires the activerecord-session_store gem).
ActionDispatch::Session::MemCacheStore - Stores the data in a memcached cluster (this is a legacy implementation; consider using CacheStore instead).

-->cookies
Application can store small amounts of data on the client - called cookies - that will be persisted across requests and even sessions. Rails provides easy access to cookies via the cookies method.

e.g->
cookies[:secret] = "this is secret key" # cookies[:key] = "value"

cookies.delete(:key) # for delete cookies.