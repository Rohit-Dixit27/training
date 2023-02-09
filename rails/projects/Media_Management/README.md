# README

Callbacks
1)before_validation

> user=User.create!(id:21,name: "rohit dixit") # Validation failed: Name is too long (maximum is 6 characters)
> user=User.create!(id:21,name: "    rohit ") # whitespaces will be removed before validation

2)after_validation

> user=User.create!(id:24,name: "   sonam ")
validation is done 
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.3ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 24], ["name", "sonam"], ["created_at", "2023-02-09 07:25:10.304580"], ["updated_at", "2023-02-09 07:25:10.304580"], ["count", nil]]
  TRANSACTION (3.9ms)  COMMIT

  3)before_save

  > user=User.new(id:1,name:"ROHIT")
 => #<User:0x000055dd38316ee0 id: 1, name: "ROHIT", created_at: nil, updated_at: nil, count: nil> 
  3.0.0 :107 > user.save
  validation is done 
  TRANSACTION (0.2ms)  BEGIN                                     
  User Create (0.3ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 1], ["name", "rohit"], ["created_at", "2023-02-09 07:31:09.658161"], ["updated_at", "2023-02-09 07:31:09.658161"], ["count", nil]]
  TRANSACTION (8.8ms)  COMMIT

  4)after_save and around save

> user=User.new(id:2,name:"ROHAN")
 => #<User:0x000055dd3841c470 id: 2, name: "ROHAN", created_at: nil, updated_at: nil, count: nil> 
3.0.0 :110 > user.save
validation is done 
in save                                                     
  TRANSACTION (0.3ms)  BEGIN                                
  User Create (0.3ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 2], ["name", "rohan"], ["created_at", "2023-02-09 07:36:08.314227"], ["updated_at", "2023-02-09 07:36:08.314227"], ["count", nil]]
out save                                      
user is saved                                 
  TRANSACTION (8.6ms)  COMMIT                 
 => true 


 5)create

  > user.save
ready to create
in                                            
  TRANSACTION (0.2ms)  BEGIN                  
  User Create (0.3ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 4], ["name", "ROHAN"], ["created_at", "2023-02-09 07:47:19.827358"], ["updated_at", "2023-02-09 07:47:19.827358"], ["count", nil]]
out                                           
after the create                              
  TRANSACTION (8.8ms)  COMMIT                 
 => true 

 6)before_update

 > user.update(name:"ritik")
  TRANSACTION (0.3ms)  BEGIN
  User Update (0.4ms)  UPDATE "users" SET "name" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["name", "RITIK"], ["updated_at", "2023-02-09 07:54:08.915353"], ["id", 1]]
  TRANSACTION (8.8ms)  COMMIT                                    
 => true 

 7)after_update(it does not effect on db)

 > user.update(name:"ritu")
  TRANSACTION (0.5ms)  BEGIN
  User Update (0.8ms)  UPDATE "users" SET "name" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["name", "RITU"], ["updated_at", "2023-02-09 07:56:55.670528"], ["id", 2]]
  TRANSACTION (8.9ms)  COMMIT                               
 => true                                                    
3.0.0 :123 > user.name
 => "RIT" 

8)around_update

 > user.update(name:"riya")
  TRANSACTION (0.3ms)  BEGIN
  User Update (0.4ms)  UPDATE "users" SET "name" = $1, "updated_at" = $2 WHERE "users"."id" = $3  [["name", "RIYA"], ["updated_at", "2023-02-09 08:02:15.112140"], ["id", 4]]
  TRANSACTION (8.3ms)  COMMIT              
 => true                                   
3.0.0 :129 > user
 => #<User:0x00007f2e285d8628 id: 4, name: "RIY", created_at: Thu, 09 Feb 2023 07:47:19.827358000 UTC +00:00, updated_at: Thu, 09 Feb 2023 08:02:15.112140000 UTC +00:00, count: nil> 

9)before_destroy(execute before delete query)

 > user.destroy
  TRANSACTION (0.2ms)  BEGIN
  Post Load (0.3ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = $1  [["user_id", 1]]
ready to destroy                                                 
  User Destroy (0.5ms)  DELETE FROM "users" WHERE "users"."id" = $1  [["id", 1]]
  TRANSACTION (1.5ms)  COMMIT 

  10)after_destroy(execute after delete query)

   > user.destroy
  TRANSACTION (0.2ms)  BEGIN
  Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = $1  [["user_id", 2]]
  User Destroy (0.3ms)  DELETE FROM "users" WHERE "users"."id" = $1  [["id", 2]]
deleted                                                          
  TRANSACTION (8.5ms)  COMMIT 

11)around_destroy(before and after delete query)

> user.destroy
  TRANSACTION (0.2ms)  BEGIN
  Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = $1  [["user_id", 4]]
in destroy                                     
  User Destroy (0.4ms)  DELETE FROM "users" WHERE "users"."id" = $1  [["id", 4]]
out destroy                                    
  TRANSACTION (8.7ms)  COMMIT 

  12)after_commit(after the commit it will executed)

  > user=User.create(id:2,name:"rohan")
  TRANSACTION (0.2ms)  BEGIN
  User Create (0.4ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 2], ["name", "rohan"], ["created_at", "2023-02-09 08:55:47.922432"], ["updated_at", "2023-02-09 08:55:47.922432"], ["count", nil]]                        
  TRANSACTION (8.9ms)  COMMIT                                                                     
all committed sucesfully  


13)after_initialized(execute just after initializing)

> user=User.new(id:3,name:"sonam")
object is initialized sucesfully
 => #<User:0x000055dd387bf438 id: 3, name: "sonam", created_at: nil, updated_at: nil, count: nil> 

 14)_after_find(execute when search an object)

 > user=User.find(2)
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
found                                                            
 => #<User:0x000055dd371258f8 id: 2, name: "rohan", created_at: Thu, 09 Feb 2023 08:55:47.922432000 UTC +00:00, updated_at: Thu, 09 Feb 2023 08:55:47.922432000 UTC +00:00, count: nil> 

[if after_initialize and after_find are together then after find will execute first]

15)after_touch

> user=User.first
  User Load (0.9ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
 => #<User:0x000055dd37fdf830 id: 2, name: "rohan", created_at: Thu, 09 Feb 2023 08:55:47.922432000 UTC +00:00, updated_at: Thu, 09 Feb 2023 08:55:47.922432000 UTC +00:00, count: nil> 
3.0.0 :166 > user.touch
  TRANSACTION (0.3ms)  BEGIN
  User Update (0.4ms)  UPDATE "users" SET "updated_at" = $1 WHERE "users"."id" = $2  [["updated_at", "2023-02-09 09:08:53.377899"], ["id", 2]]
touched an object                                                         
  TRANSACTION (8.8ms)  COMMIT                                             
 => true 

 16)Relational Callback

-Callbacks work through model relationships, and can even be defined by them.	
-when a user is deleted then its posts are also deleted.

 > user.destroy
  TRANSACTION (0.3ms)  BEGIN
  Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = $1  [["user_id", 2]]
  Post Destroy (0.3ms)  DELETE FROM "posts" WHERE "posts"."id" = $1  [["id", 1]] 
post of user rohan is deleted                                                    
  User Destroy (0.3ms)  DELETE FROM "users" WHERE "users"."id" = $1  [["id", 2]] 
  TRANSACTION (8.3ms)  COMMIT 


17)Callback Class(it possible to create classes that encapsulate the callback methods, so they can be reused.)

> post.destroy
  TRANSACTION (0.2ms)  BEGIN
  Post Destroy (0.3ms)  DELETE FROM "posts" WHERE "posts"."id" = $1  [["id", 1]]
destroyed                                                   
  TRANSACTION (8.7ms)  COMMIT 


18)Halting execution
-The whole callback chain is wrapped in a transaction. 
-If any callback raises an exception, the execution chain gets halted and a ROLLBACK is issued. To intentionally stop a chain use

> user.posts.create!(id:7,name:"post7")
/usr/share/rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4.2/lib/active_record/persistence.rb:648:in `save!': Failed to save the record (ActiveRecord::RecordNotSaved)

18)conditional Callback

> user=User.new(id:8,name:"Priya")
 => #<User:0x000055dd38367610 id: 8, name: "Priya", created_at: nil, updated_at: nil, count: nil> 
3.0.0 :244 > user.save!
ready to save
  TRANSACTION (0.2ms)  BEGIN          
  User Create (0.4ms)  INSERT INTO "users" ("id", "name", "created_at", "updated_at", "count") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 8], ["name", "Priya"], ["created_at", "2023-02-09 10:29:02.038192"], ["updated_at", "2023-02-09 10:29:02.038192"], ["count", nil]]
  TRANSACTION (3.9ms)  COMMIT         
 => true  










