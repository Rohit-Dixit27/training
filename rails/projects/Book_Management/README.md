# README

----------Active Record Query Interface-----------

->To retrieve objects from the database, Active Record provides several finder methods.
->Each finder method allows you to pass arguments into it to perform certain queries on your database without writing raw SQL.

-----Retrieving a single object

1)Find
-Using the find method, you can retrieve the object corresponding to the specified primary key that matches any supplied options
e.g->

> author=Author.find(2)
  Author Load (0.9ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 LIMIT $2  [["id", 2], ["LIMIT", 1]]
 =>                                                                  
#<Author:0x000055e6ef832cb0                                          
...                                                                  
3.0.0 :002 > author
 => 
#<Author:0x000055e6ef832cb0                                          
 id: 2,                                                              
 name: "Ritika",                                                     
 created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,         
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,         
 lock_version: 16,                                                   
 books_count: 13,                                                    
 address: nil,                                                       
 salary: 0.12001e5,                                                  
 date_of_birth: nil,
 gender: "female",
 contact: "7678265601",
 join_date: Sat, 01 Jan 2022,
 resign_date: Sun, 01 Jan 2023>

 ---->Call the find method and pass in an array of primary keys. The return will be an array containing all of the matching records for the supplied primary keys.
 e.g->
 > author=Author.find(2,6)
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2)  [["id", 2], ["id", 6]]
 => 
[#<Author:0x000055e6f02b7528
... 
3.0.0 :004 > author
 => 
[#<Author:0x000055e6f02b7528
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>,
 #<Author:0x000055e6f02b7460
  id: 6,
  name: "minku",
  created_at: Mon, 06 Feb 2023 04:42:28.130732000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:28.130732000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>]

  2)take
  The take method retrieves a record without any implicit ordering

  e.g->
  > author=Author.take
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" LIMIT $1  [["LIMIT", 1]]
 =>                                                                  
#<Author:0x000055e6eecc5788                                          
...                                                                  
3.0.0 :006 > author
 => 
#<Author:0x000055e6eecc5788                                          
 id: 3,                                                              
 name: "sonam",                                                      
 created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00,         
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,         
 lock_version: 3,                                                    
 books_count: 11,                                                    
 address: nil,                                                       
 salary: nil,                                                        
 date_of_birth: nil,
 gender: nil,
 contact: nil,
 join_date: nil,
 resign_date: nil>

 ----You can pass in a numerical argument to the take method to return up to that number of results.
 e.g->

 > author=Author.take(2)
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" LIMIT $1  [["LIMIT", 2]]
 =>                             
[#<Author:0x000055e6f00f3de0
... 
3.0.0 :008 > author
 => 
[#<Author:0x000055e6f00f3de0
  id: 3,
  name: "sonam",
  created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 3,
  books_count: 11,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f00f3d18
  id: 7,
  name: "sunny",
  created_at: Thu, 02 Feb 2023 08:51:59.781404000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 6,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>] 

  [The take! method behaves exactly like take, except that it will raise ActiveRecord::RecordNotFound if no matching record is found]

  3)first
  The first method finds the first record ordered by primary key (default). 
  e.g->
  > Author.first
  Author Load (0.9ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                  
#<Author:0x000055e6f03d7c78                                          
 id: 1,                                                              
 name: "rohit",                                                      
 created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,         
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,         
 lock_version: 4,                                                    
 books_count: 10,                                                    
 address: nil,                                                       
 salary: nil,                                                 
 date_of_birth: Thu, 27 Jul 2000,                             
 gender: nil,                                                 
 contact: nil,                                                
 join_date: nil,                                              
 resign_date: nil> 

 -----------You can pass in a numerical argument to the first method to return up to that number of results.
 e.g->

 > Author.first(2)
  Author Load (0.8ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 2]]
 => 
[#<Author:0x000055e6eff63868
  id: 1,
  name: "rohit",
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 4,
  books_count: 10,
  address: nil,
  salary: nil,
  date_of_birth: Thu, 27 Jul 2000,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6eff637a0
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>]

  -------------On a collection that is ordered using order, first will return the first record ordered by the specified attribute for order.
  e.g->
    
  > Author.order(:name).first
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."name" ASC LIMIT $1  [["LIMIT", 1]]
 =>                                                                                 
#<Author:0x000055e6f06eaca8                                                         
 id: 21,                                                                            
 name: "meetu",                                                                     
 created_at: Sat, 04 Feb 2023 06:44:14.285476000 UTC +00:00,                        
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                        
 lock_version: 1,                                                                   
 books_count: nil,                                                                  
 address: nil,                                                                      
 salary: 0.12e6,                                                                    
 date_of_birth: nil,                                                                
 gender: "female",                                                                  
 contact: nil,                                                                      
 join_date: Fri, 01 Jan 2021,                                                       
 resign_date: Sat, 01 Jan 2022> 

[The first! method behaves exactly like first, except that it will raise ActiveRecord::RecordNotFound if no matching record is found]

 4)last
 The last method finds the last record ordered by primary key (default). 
 e.g->
 > Author.last
  Author Load (0.9ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" DESC LIMIT $1  [["LIMIT", 1]]
 =>                      
#<Author:0x000055e6f114a6d0
 id: 22,
 name: "Seetu",
 created_at: Sat, 04 Feb 2023 06:56:20.775467000 UTC +00:00,
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
 lock_version: 1,
 books_count: nil,
 address: nil,
 salary: 0.12e6,
 date_of_birth: nil,
 gender: "female",
 contact: nil,
 join_date: Fri, 01 Jan 2021,
 resign_date: Sat, 01 Jan 2022>

 ------------You can pass in a numerical argument to the last method to return up to that number of results.
 e.g->
 > Author.last(2)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" DESC LIMIT $1  [["LIMIT", 2]]
 => 
[#<Author:0x00007f37e0983860
  id: 21,
  name: "meetu",
  created_at: Sat, 04 Feb 2023 06:44:14.285476000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 1,
  books_count: nil,
  address: nil,
  salary: 0.12e6,
  date_of_birth: nil,
  gender: "female",
  contact: nil,
  join_date: Fri, 01 Jan 2021,
  resign_date: Sat, 01 Jan 2022>,
 #<Author:0x00007f37e09839f0
  id: 22,
  name: "Seetu",
  created_at: Sat, 04 Feb 2023 06:56:20.775467000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 1,
  books_count: nil,
  address: nil,
  salary: 0.12e6,
  date_of_birth: nil,
  gender: "female",
  contact: nil,
  join_date: Fri, 01 Jan 2021,
  resign_date: Sat, 01 Jan 2022>

  --------------On a collection that is ordered using order, last will return the last record ordered by the specified attribute for order.
  e.g->
  > Author.order(:name).last
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."name" DESC LIMIT $1  [["LIMIT", 1]]
 =>                                                                                 
#<Author:0x000055e6eff02fe0                                                         
 id: 17,                                                                            
 name: "vishal",                                                                    
 created_at: Fri, 03 Feb 2023 06:07:37.570547000 UTC +00:00,                        
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                        
 lock_version: 2,                                                                   
 books_count: 1,                                                                    
 address: nil,                                                                      
 salary: nil,                                                                       
 date_of_birth: nil,                                                                
 gender: nil,                                                                       
 contact: nil,                                                                      
 join_date: nil,                                                                    
 resign_date: nil> 
[The last! method behaves exactly like last, except that it will raise ActiveRecord::RecordNotFound if no matching record is found]

5)find_by
The find_by method finds the first record matching some conditions.

e.g->
> Author.find_by(name:"prince")
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 LIMIT $2  [["name", "prince"], ["LIMIT", 1]]
 =>                                                           
#<Author:0x000055e6f0f819c0                                   
 id: 5,                                                       
 name: "prince",                                              
 created_at: Thu, 02 Feb 2023 08:49:08.093030000 UTC +00:00,  
 updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,  
 lock_version: 5,                                             
 books_count: 7,                                              
 address: nil,                                                
 salary: 0.111e6,                                             
 date_of_birth: nil,                                          
 gender: "male",                                              
 contact: nil,                                                
 join_date: Tue, 01 Jan 2019,                                 
 resign_date: Wed, 01 Jan 2020> 

 -----------find_by!
 The find_by! method behaves exactly like find_by, except that it will raise ActiveRecord::RecordNotFound if no matching record is found. 

 e.g->
 > Author.find_by!(name:"siya")
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 LIMIT $2  [["name", "siya"], ["LIMIT", 1]]
/usr/share/rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4.2/lib/active_record/relation/finder_methods.rb:378:in `raise_record_not_found_exception!': Couldn't find Author with [WHERE "authors"."name" = $1] (ActiveRecord::RecordNotFound)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

---------Retrieving Multiple Objects in Batches

We often need to iterate over a large set of records, as when we send a newsletter to a large set of customers, or when we export data.

1)all.each
[But this approach becomes increasingly impractical as the table size increases, since "Customer.all.each" instructs Active Record to fetch the entire table in a single pass, build a model object per row, and then keep the entire array of model objects in memory.]


> Author.all.each do |author|
3.0.0 :027 >   author.name
3.0.0 :028 > end
  Author Load (0.4ms)  SELECT "authors".* FROM "authors"
 =>                                                             
[#<Author:0x000055e6f0919948                                    
  id: 3,                                                        
  name: "sonam",                                                
  created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00,   
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,   
  lock_version: 3,                                              
  books_count: 11,                                              
  address: nil,                                                 
  salary: nil,                                                  
  date_of_birth: nil,                                           
  gender: nil,                                                  
  contact: nil,                                                 
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0919880
  id: 7,
  name: "sunny",
  created_at: Thu, 02 Feb 2023 08:51:59.781404000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 6,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f09197b8
  id: 15,
  name: "Sonu",
  created_at: Fri, 03 Feb 2023 05:37:04.714237000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 1,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f09196f0
  id: 17,
  name: "vishal",
  created_at: Fri, 03 Feb 2023 06:07:37.570547000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 1,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0919628
  id: 1,
  name: "rohit",
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 4,
  books_count: 10,
  address: nil,
  salary: nil,
  date_of_birth: Thu, 27 Jul 2000,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0919560
  id: 20,
  name: "Reetu",
  created_at: Sat, 04 Feb 2023 06:44:03.428946000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 1,
  books_count: nil,
  address: nil,
  salary: 0.12e6,
  date_of_birth: nil,
  gender: "female",
  contact: nil,
  join_date: Fri, 01 Jan 2021,
  resign_date: Sat, 01 Jan 2022>,
 #<Author:0x000055e6f0919498
  id: 21,
  name: "meetu",
  created_at: Sat, 04 Feb 2023 06:44:14.285476000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 1,
  books_count: nil,
  address: nil,
  salary: 0.12e6,
  date_of_birth: nil,
  gender: "female",
  contact: nil,
  join_date: Fri, 01 Jan 2021,
  resign_date: Sat, 01 Jan 2022>,
 #<Author:0x000055e6f09193d0
  id: 22,
  name: "Seetu",
  created_at: Sat, 04 Feb 2023 06:56:20.775467000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 1,
  books_count: nil,
  address: nil,
  salary: 0.12e6,
  date_of_birth: nil,
  gender: "female",
  contact: nil,
  join_date: Fri, 01 Jan 2021,
  resign_date: Sat, 01 Jan 2022>,
 #<Author:0x000055e6f0919308
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>,
 #<Author:0x000055e6f0919240
  id: 5,
  name: "prince",
  created_at: Thu, 02 Feb 2023 08:49:08.093030000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 5,
  books_count: 7,
  address: nil,
  salary: 0.111e6,
  date_of_birth: nil,
  gender: "male",
  contact: nil,
  join_date: Tue, 01 Jan 2019,
  resign_date: Wed, 01 Jan 2020>,
 #<Author:0x000055e6f0919178
  id: 4,
  name: "rinku",
  created_at: Mon, 06 Feb 2023 04:42:04.248874000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:04.248874000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0919088
  id: 6,
  name: "minku",
  created_at: Mon, 06 Feb 2023 04:42:28.130732000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:28.130732000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0918f70
  id: 8,
  name: "sinku",
  created_at: Mon, 06 Feb 2023 04:42:45.504938000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:45.504938000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0918ea8
  id: 9,
  name: "tinku",
  created_at: Mon, 06 Feb 2023 04:42:51.714232000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:51.714232000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0918de0
  id: 10,
  name: "seema",
  created_at: Mon, 06 Feb 2023 04:43:03.809998000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:43:03.809998000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>] 
3.0.0 :029 > 

2)find_each
-Retrieves a batch of records and then yields each record to the block individually as a model. 
-Retrieves records in batches of 1000 and yields them to the block one by one:
-it works on model classes and on relations.
e.g->

> Author.find_each do |author|
3.0.0 :051 >   puts author.name
3.0.0 :052 > end
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1000]]
rohit                                                                                  
Ritika                                                                                 
sonam                                                                                  
rinku                                                                                  
prince                                                                                 
minku                                                                                  
sunny                                                                                  
sinku                                                                
tinku                                                                
seema                                                                
Sonu                                                                 
vishal                                                               
Reetu                                                                
meetu
Seetu

-----options used in find_each
-->a) batch_size

we cab define the batch size.

e.g->
> Author.find_each(batch_size:5) do |author|
3.0.0 :057 >   puts author.name
3.0.0 :058 > end
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 5]]
rohit                                     
Ritika                                    
sonam                                     
rinku                                     
prince                                    
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 5], ["LIMIT", 5]]
minku
sunny
sinku
tinku
seema
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 10], ["LIMIT", 5]]
Sonu
vishal
Reetu
meetu
Seetu

-->b) start

-start defines the starting primary key.
[here it will start from key 4 to end.]
e.g->
> Author.find_each(start:4) do |author|
3.0.0 :063 >   puts author.name
3.0.0 :064 > end
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" >= $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 4], ["LIMIT", 1000]]
rinku                                                    
prince                                                   
minku                                                    
sunny                                                    
sinku                                                    
tinku                                                    
seema                                                    
Sonu                                                     
vishal                                                   
Reetu                                                    
meetu                                                    
Seetu 

-->c) finish

it will define the last id.
[here starting id is 4 and end id is 10]
e.g->
> Author.find_each(start:4, finish:10) do |author|
3.0.0 :066 >   puts author.name
3.0.0 :067 > end
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" >= $1 AND "authors"."id" <= $2 ORDER BY "authors"."id" ASC LIMIT $3  [["id", 4], ["id", 10], ["LIMIT", 1000]]
rinku                                         
prince                                        
minku                                         
sunny                                         
sinku                                         
tinku                                         
seema


3)find_in_batches
The find_in_batches method is similar to find_each, since both retrieve batches of records. The difference is that find_in_batches yields batches to the block as an array of models, instead of individually. 

e.g->
> Author.find_in_batches do |author|
3.0.0 :078 >   author.each do |a|
3.0.0 :079 >     puts a.name
3.0.0 :080 >   end
3.0.0 :081 > end
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 1000]]
rohit                                                                            
Ritika                                                                           
sonam                                                                            
rinku                                                                            
prince                                                                           
minku                                                                            
sunny                                                                            
sinku                                                                            
tinku                                                                            
seema                                                                            
Sonu                                                                             
vishal                                                                           
Reetu                         
meetu
Seetu

-----options
a) batch_size
-define the batch size load at one time.
e.g->
> Author.find_in_batches(batch_size:3) do |author|
3.0.0 :083 >   author.each do |a|
3.0.0 :084 >     puts a.name
3.0.0 :085 >   end
3.0.0 :086 > end
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 3]]
rohit                                           
Ritika                                          
sonam                                           
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 3], ["LIMIT", 3]]
rinku
prince
minku
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 6], ["LIMIT", 3]]
sunny
sinku
tinku
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 9], ["LIMIT", 3]]
seema
Sonu
vishal
  Author Load (0.2ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" > $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 17], ["LIMIT", 3]]
Reetu
meetu
Seetu

b) start
-it define the starting key.
e.g->
> Author.find_in_batches(start:3) do |author|
3.0.0 :088 >   author.each do |a|
3.0.0 :089 >     puts a.name
3.0.0 :090 >   end
3.0.0 :091 > end
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" >= $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 3], ["LIMIT", 1000]]
sonam                                                          
rinku                                                          
prince                                                         
minku                                                          
sunny                                                          
sinku                                                          
tinku                                                          
seema                                                          
Sonu                                                           
vishal                                                         
Reetu
meetu
Seetu

c) finish
-by default start is 1 , till the finish
[here it will be from 1 to 3 keys]
e.g->
> Author.find_in_batches(finish:3) do |author|
3.0.0 :093 >   author.each do |a|
3.0.0 :094 >     puts a.name
3.0.0 :095 >   end
3.0.0 :096 > end
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" <= $1 ORDER BY "authors"."id" ASC LIMIT $2  [["id", 3], ["LIMIT", 1000]]
rohit                                                          
Ritika                                                         
sonam

----------------------------------------------------------------------------------------------------------------------------------------------------------
----------Conditions
The where method allows you to specify conditions to limit the records returned, representing the WHERE-part of the SQL statement. Conditions can either be specified as a string, array, or hash.

1)Pure String Conditions

e.g->
> Book.where("title ='operating system'")
  Book Load (0.5ms)  SELECT "books".* FROM "books" WHERE (title ='operating system')
 =>                                                                                       
[#<Book:0x000055e6f0ee24b0                                                                
  id: 7,                                                                                  
  name: "OS",                                                                             
  created_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,                             
  updated_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,                             
  type: nil,                                                                              
  description: nil,                                                 
  title: "operating system",                                        
  author_id: 5,                                                     
  price: nil>]


  2)Hash Conditions
  Active Record also allows you to pass in hash conditions which can increase the readability of your conditions syntax. With hash conditions, you pass in a hash with keys of the fields you want qualified and the values of how you want to qualify them:

  [Only equality, range, and subset checking are possible with Hash conditions]

  e.g->
  > Author.where(books_count: true)
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."books_count" = $1  [["books_count", 1]]
 =>                                                         
[#<Author:0x000055e6f078aff0                                
  id: 15,                                                   
  name: "Sonu",                                             
  created_at: Fri, 03 Feb 2023 05:37:04.714237000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,                                 
  books_count: 1,                                  
  address: nil,                                    
  salary: nil,                                     
  date_of_birth: nil,                              
  gender: nil,                                     
  contact: nil,                                    
  join_date: nil,                                  
  resign_date: nil>,
 #<Author:0x000055e6f078af28
  id: 17,
  name: "vishal",
  created_at: Fri, 03 Feb 2023 06:07:37.570547000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 1,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>] 

  [return authors whose books_count=1]

  ---------The field name can also be a string:

  > Author.where('books_count'=> 7)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."books_count" = $1  [["books_count", 7]]
 => 
[#<Author:0x000055e6f1110110
  id: 5,
  name: "prince",
  created_at: Thu, 02 Feb 2023 08:49:08.093030000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 5,
  books_count: 7,
  address: nil,
  salary: 0.111e6,
  date_of_birth: nil,
  gender: "male",
  contact: nil,
  join_date: Tue, 01 Jan 2019,
  resign_date: Wed, 01 Jan 2020>] 

-----------------------Range Conditions
e.g->
> Author.where(id:1..3)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" BETWEEN $1 AND $2  [["id", 1], ["id", 3]]
 =>                                                                                      
[#<Author:0x000055e6f0dbbfc8                                                             
  id: 3,                                                                                 
  name: "sonam",                                                                         
  created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00,                            
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                            
  lock_version: 3,                                                                       
  books_count: 11,                                                                       
  address: nil,                                                                          
  salary: nil,                                                                           
  date_of_birth: nil,                                                                    
  gender: nil,                                                                           
  contact: nil,                                                                          
  join_date: nil,                                                                        
  resign_date: nil>,
 #<Author:0x000055e6f0dbbf00
  id: 1,
  name: "rohit",
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 4,
  books_count: 10,
  address: nil,
  salary: nil,
  date_of_birth: Thu, 27 Jul 2000,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0dbbe38
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>] 



-------------Subset Conditions
If you want to find records using the IN expression you can pass an array to the conditions hash:

e.g->
> Author.where(books_count: [6,11])
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."books_count" IN ($1, $2)  [["books_count", 6], ["books_count", 11]]
 => 
[#<Author:0x000055e6f013be10
  id: 3,
  name: "sonam",
  created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 3,
  books_count: 11,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f013bd48
  id: 7,
  name: "sunny",
  created_at: Thu, 02 Feb 2023 08:51:59.781404000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 6,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>] 


  ---------Not Conditions
  NOT SQL queries can be built by where.not:

e.g->
[it will return authors whose books_count is not 1 ,6 and 11]

  > Author.where.not(books_count: [1,6,11])
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" WHERE "authors"."books_count" NOT IN ($1, $2, $3)  [["books_count", 1], ["books_count", 6], ["books_count", 11]]
 =>                                                                                
[#<Author:0x000055e6f05179d0                                                       
  id: 1,                                                                           
  name: "rohit",                                                                   
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,                      
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                      
  lock_version: 4,                                                                 
  books_count: 10,                                                                 
  address: nil,                                                                    
  salary: nil,                                                                     
  date_of_birth: Thu, 27 Jul 2000,                                                 
  gender: nil,                                                                     
  contact: nil,                                                                    
  join_date: nil,                                                                  
  resign_date: nil>,
 #<Author:0x000055e6f0517908
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>,
 #<Author:0x000055e6f0517840
  id: 5,
  name: "prince",
  created_at: Thu, 02 Feb 2023 08:49:08.093030000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 5,
  books_count: 7,
  address: nil,
  salary: 0.111e6,
  date_of_birth: nil,
  gender: "male",
  contact: nil,
  join_date: Tue, 01 Jan 2019,
  resign_date: Wed, 01 Jan 2020>] 

  ----------------Or Conditions
  OR conditions between two relations can be built by calling or on the first relation, and passing the second one as an argument.

  e.g->
   > Author.where(name: "rohit").or(Author.where(books_count: [6,10]))
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE ("authors"."name" = $1 OR "authors"."books_count" IN ($2, $3))  [["name", "rohit"], ["books_count", 6], ["books_count", 10]]
 => 
[#<Author:0x000055e6f0052ee0
  id: 7,
  name: "sunny",
  created_at: Thu, 02 Feb 2023 08:51:59.781404000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 2,
  books_count: 6,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f0052e18
  id: 1,
  name: "rohit",
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 4,
  books_count: 10,
  address: nil,
  salary: nil,
  date_of_birth: Thu, 27 Jul 2000,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>]


  ----------------And Conditions
  AND conditions can be built by chaining where conditions.

  e.g->
 > Author.where(name: "rohit").where(books_count: 10)
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 AND "authors"."books_count" = $2  [["name", "rohit"], ["books_count", 10]]
 =>                                                                                             
[#<Author:0x000055e6f06380f8                                                                    
  id: 1,                                                                                        
  name: "rohit",                                                                                
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00,                                   
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                                   
  lock_version: 4,                                                                              
  books_count: 10,                                                                              
  address: nil,                                                                                 
  salary: nil,                                                                                  
  date_of_birth: Thu, 27 Jul 2000,                                                              
  gender: nil,                                                                                  
  contact: nil,                                                                                 
  join_date: nil,                                                                               
  resign_date: nil>] 

-----------AND conditions for the logical intersection between relations can be built by calling and on the first relation, and passing the second one as an argument.

e.g->
 > Author.where(id:[1,2]).and(Author.where(id:[2,3]))
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2) AND "authors"."id" IN ($3, $4)  [["id", 1], ["id", 2], ["id", 2], ["id", 3]]
 =>                                                                                          
[#<Author:0x000055e6f01a4fa0                                                                 
  id: 2,                                                                                     
  name: "Ritika",                                                                            
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,                                
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,                                
  lock_version: 16,                                                                          
  books_count: 13,                                                                           
  address: nil,                                                                              
  salary: 0.12001e5,                                                                         
  date_of_birth: nil,                                                                        
  gender: "female",                                                                          
  contact: "7678265601",                                                                     
  join_date: Sat, 01 Jan 2022,                                                               
  resign_date: Sun, 01 Jan 2023>] 


3)Ordering
To retrieve records from the database in a specific order, you can use the order method.
Author.order(:created_at)
# OR
Author.order("created_at")

-->You could specify ASC or DESC as well:

Author.order(created_at: :desc)
# OR
Author.order(created_at: :asc)
# OR
Author.order("created_at DESC")
# OR
Author.order("created_at ASC")

-->Or ordering by multiple fields.
> Author.order("id DESC","name ASC")

----->If you want to call order multiple times, subsequent orders will be appended to the first:

> Author.order("id DESC").order("name ASC")

SELECT * FROM authors ORDER BY id DESC, name ASC


4)Selecting specific fields.

-By default, Model.find selects all the fields from the result set using select *.
-To select only a subset of fields from the result set, you can specify the subset via the select method.

e.g->
> Author.select(:id,:name)
     or
     Author.select("id","name")
  Author Load (0.4ms)  SELECT "authors"."id", "authors"."name" FROM "authors"
 =>                                                                                  
[#<Author:0x000055e6f0989310 id: 3, name: "sonam">,                                  
 #<Author:0x000055e6f0989248 id: 7, name: "sunny">,                                  
 #<Author:0x000055e6f0989180 id: 15, name: "Sonu">,                                  
 #<Author:0x000055e6f09890b8 id: 17, name: "vishal">,                                
 #<Author:0x000055e6f0988ff0 id: 1, name: "rohit">,                                  
 #<Author:0x000055e6f0988f28 id: 20, name: "Reetu">,                                 
 #<Author:0x000055e6f0988e60 id: 21, name: "meetu">,                                 
 #<Author:0x000055e6f0988d98 id: 22, name: "Seetu">,                                 
 #<Author:0x000055e6f0988cd0 id: 2, name: "Ritika">,                                 
 #<Author:0x000055e6f0988be0 id: 5, name: "prince">,                                 
 #<Author:0x000055e6f0988b18 id: 4, name: "rinku">,                                  
 #<Author:0x000055e6f0988a00 id: 6, name: "minku">,                                  
 #<Author:0x000055e6f0988938 id: 8, name: "sinku">,                                  
 #<Author:0x000055e6f0988870 id: 9, name: "tinku">,
 #<Author:0x000055e6f09887a8 id: 10, name: "seema">] 


------------distinct
e.g->
> Author.select(:name).distinct
  Author Load (0.3ms)  SELECT DISTINCT "authors"."name" FROM "authors"
 =>                                                                                         
[#<Author:0x000055e6f041fb18 id: nil, name: "Seetu">,                                       
 #<Author:0x000055e6f0447af0 id: nil, name: "Reetu">,                                       
 #<Author:0x000055e6f0447a28 id: nil, name: "sunny">,                                       
 #<Author:0x000055e6f0447960 id: nil, name: "Ritika">,                                      
 #<Author:0x000055e6f0447898 id: nil, name: "minku">,                                       
 #<Author:0x000055e6f04477d0 id: nil, name: "Sonu">,                                        
 #<Author:0x000055e6f0447708 id: nil, name: "prince">,                                      
 #<Author:0x000055e6f0447640 id: nil, name: "rohit">,                                
 #<Author:0x000055e6f0447578 id: nil, name: "sonam">,                                
 #<Author:0x000055e6f04474b0 id: nil, name: "rinku">,                                
 #<Author:0x000055e6f04473e8 id: nil, name: "meetu">,                                
 #<Author:0x000055e6f0447320 id: nil, name: "sinku">,                                
 #<Author:0x000055e6f0447258 id: nil, name: "vishal">,                               
 #<Author:0x000055e6f0447190 id: nil, name: "tinku">] 


----------------distinct(false)
[Include duplicate values]
> author=Author.select(:name).distinct
> author.distinct(false)
  Author Load (0.4ms)  SELECT "authors"."name" FROM "authors"
 =>                                                   
[#<Author:0x000055e6f057d708 id: nil, name: "rohit">, 
 #<Author:0x000055e6f057d640 id: nil, name: "sonam">, 
 #<Author:0x000055e6f057d578 id: nil, name: "sunny">, 
 #<Author:0x000055e6f057d4b0 id: nil, name: "Sonu">,  
 #<Author:0x000055e6f057d3e8 id: nil, name: "vishal">,
 #<Author:0x000055e6f057d320 id: nil, name: "rohit">, 
 #<Author:0x000055e6f057d258 id: nil, name: "Reetu">, 
 #<Author:0x000055e6f057d190 id: nil, name: "meetu">, 
 #<Author:0x000055e6f057d0c8 id: nil, name: "Seetu">, 
 #<Author:0x000055e6f057d000 id: nil, name: "Ritika">,
 #<Author:0x000055e6f057cf38 id: nil, name: "prince">,
 #<Author:0x000055e6f057ce70 id: nil, name: "rinku">, 
 #<Author:0x000055e6f057cda8 id: nil, name: "minku">, 
 #<Author:0x000055e6f057cce0 id: nil, name: "sinku">,
 #<Author:0x000055e6f057cc18 id: nil, name: "tinku">] 




5)Limit and offset
You can use limit to specify the number of records to be retrieved, and use offset to specify the number of records to skip before starting to return the records.
e.g->
[ it will return the first 5 in the table]
> Author.limit(2)

  Author Load (0.3ms)  SELECT "authors".* FROM "authors" ORDER BY "authors"."id" ASC LIMIT $1  [["LIMIT", 2]]
 =>                                                           
[#<Author:0x000055e6f098b480                                  
  id: 1,                                                      
  name: "rohit",                                              
  created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00, 
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00, 
  lock_version: 4,                                            
  books_count: 10,                                            
  address: nil,                                               
  salary: nil,                                                
  date_of_birth: Thu, 27 Jul 2000,                            
  gender: nil,                                                
  contact: nil,                                               
  join_date: nil,                                             
  resign_date: nil>,
 #<Author:0x000055e6f098b3b8
  id: 2,
  name: "Ritika",
  created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 10:58:17.467468000 UTC +00:00,
  lock_version: 16,
  books_count: 13,
  address: nil,
  salary: 0.12001e5,
  date_of_birth: nil,
  gender: "female",
  contact: "7678265601",
  join_date: Sat, 01 Jan 2022,
  resign_date: Sun, 01 Jan 2023>] 


---------offset
[limit-2,so 2 records after skip 13 records]
> Author.limit(2).offset(13)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" LIMIT $1 OFFSET $2  [["LIMIT", 2], ["OFFSET", 13]]
 => 
[#<Author:0x000055e6f071b3f8
  id: 8,
  name: "sinku",
  created_at: Mon, 06 Feb 2023 04:42:45.504938000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:45.504938000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>,
 #<Author:0x000055e6f071b330
  id: 9,
  name: "tinku",
  created_at: Mon, 06 Feb 2023 04:42:51.714232000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:42:51.714232000 UTC +00:00,
  lock_version: 0,
  books_count: nil,
  address: nil,
  salary: nil,
  date_of_birth: nil,
  gender: nil,
  contact: nil,
  join_date: nil,
  resign_date: nil>] 

  6)Group
  To apply a GROUP BY clause to the SQL fired by the finder, you can use the group method.
e.g->
[collection of the dates on which authors were created:]
   > Author.select(:created_at).group(:created_at)
  Author Load (0.5ms)  SELECT "authors"."created_at" FROM "authors" GROUP BY "authors"."created_at"
 =>                                                                                                     
[#<Author:0x000055e6f0061030 id: nil, created_at: Mon, 06 Feb 2023 04:42:28.130732000 UTC +00:00>,      
 #<Author:0x000055e6f0060f68 id: nil, created_at: Mon, 06 Feb 2023 04:43:03.809998000 UTC +00:00>,      
 #<Author:0x000055e6f0060ea0 id: nil, created_at: Mon, 06 Feb 2023 04:42:45.504938000 UTC +00:00>,      
 #<Author:0x000055e6f0060dd8 id: nil, created_at: Mon, 06 Feb 2023 04:42:04.248874000 UTC +00:00>,      
 #<Author:0x000055e6f0060d10 id: nil, created_at: Fri, 03 Feb 2023 05:37:04.714237000 UTC +00:00>,      
 #<Author:0x000055e6f0060c48 id: nil, created_at: Sat, 04 Feb 2023 06:44:14.285476000 UTC +00:00>,      
 #<Author:0x000055e6f0060b80 id: nil, created_at: Thu, 02 Feb 2023 05:30:42.053118000 UTC +00:00>,      
 #<Author:0x000055e6f0060ab8 id: nil, created_at: Thu, 02 Feb 2023 05:30:50.534659000 UTC +00:00>,      
 #<Author:0x000055e6f00609f0 id: nil, created_at: Sat, 04 Feb 2023 06:56:20.775467000 UTC +00:00>,      
 #<Author:0x000055e6f0060928 id: nil, created_at: Fri, 03 Feb 2023 06:07:37.570547000 UTC +00:00>,      
 #<Author:0x000055e6f0060860 id: nil, created_at: Thu, 02 Feb 2023 05:30:47.104306000 UTC +00:00>,      
 #<Author:0x000055e6f0060798 id: nil, created_at: Thu, 02 Feb 2023 08:49:08.093030000 UTC +00:00>,      
 #<Author:0x000055e6f00606d0 id: nil, created_at: Mon, 06 Feb 2023 04:42:51.714232000 UTC +00:00>,      
 #<Author:0x000055e6f0060608 id: nil, created_at: Sat, 04 Feb 2023 06:44:03.428946000 UTC +00:00>,
 #<Author:0x000055e6f0060540 id: nil, created_at: Thu, 02 Feb 2023 08:51:59.781404000 UTC +00:00>] 

---------count
e.g->
> Author.group(:books_count).count
  Author Count (0.5ms)  SELECT COUNT(*) AS "count_all", "authors"."books_count" AS "authors_books_count" FROM "authors" GROUP BY "authors"."books_count"
 => {11=>1, 7=>1, 13=>1, 10=>1, nil=>8, 1=>2, 6=>1}  


7)Having
SQL uses the HAVING clause to specify conditions on the GROUP BY fields. You can add the HAVING clause to the SQL fired by the Model.find by adding the having method to the find.
e.g->
> get_count=Author.select("books_count,count(books_count) AS total").group(:books_count).having("count(books_count) > ?", 2)
  Author Load (0.4ms)  SELECT books_count,count(books_count) AS total FROM "authors" GROUP BY "authors"."books_count" HAVING (count(books_count) > 2)
 => [#<Author:0x000055e6f03dd510 id: nil, books_count: 5>, #<Author:0x000055e6f03dd448 id: nil, books_count: 12>] 
3.0.0 :222 > get_count[0].total
 => 3 







