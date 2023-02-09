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