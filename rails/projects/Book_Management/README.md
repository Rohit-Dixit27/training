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

  3) Array Conditions
  -Now what if that title could vary, say as an argument from somewhere? The find would then take the form:
  >title = "operating system"
  > Book.where("title = ?", title)
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE (title = 'operating system')
 =>                                                                  
[#<Book:0x000055a370494670                                           
  id: 7,                                                             
  name: "OS",                                                        
  created_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,        
  updated_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,        
  type: nil,                                                         
  description: nil,                                                  
  title: "operating system",                                         
  author_id: 5,                                                      
  price: 0.1e3>] 


---------Conditions That Use LIKE
Although condition arguments are automatically escaped to prevent SQL injection, SQL LIKE wildcards (i.e., % and _) are not escaped. This may cause unexpected behavior if an unsanitized value is used in an argument. 

  [Note-In the above code, the intent is to match titles that start with a user-specified string. 
  However, any occurrences of % or _ in params[:title] will be  treated as wildcards, leading to surprising query results. 
  In some circumstances, this may also prevent the database from using an intended index, leading to a much slower query.
  To avoid these problems, use sanitize_sql_like to escape wildcard characters in the relevant portion of the argument:]

 > title="o"
 => "o" 
3.0.0 :177 > Book.where("title LIKE ?",
3.0.0 :178 >   Book.sanitize_sql_like(title) + "%")
  Book Load (0.4ms)  SELECT "books".* FROM "books" WHERE (title LIKE 'o%')
 => 
[#<Book:0x000055a37026db30
  id: 7,
  name: "OS",
  created_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,
  updated_at: Mon, 06 Feb 2023 04:45:13.969066000 UTC +00:00,
  type: nil,
  description: nil,
  title: "operating system",
  author_id: 5,
  price: 0.1e3>] 


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

8)Overriding conditions

1)unscope
You can specify certain conditions to be removed using the unscope method
e.g->
[unscope means here order will not execute]
> Author.where('id > 10').limit(2).order('id desc').unscope(:order)
  Author Load (0.4ms)  SELECT "authors".* FROM "authors" WHERE (id > 10) LIMIT $1  [["LIMIT", 2]]
 => 
[#<Author:0x000055e6f10620b0
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
 #<Author:0x000055e6f1061fc0
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



2)only
You can also override conditions using the only method.it means only that will execute
e.g->
[here order and where are only execute.]
> Author.where('id < 3').limit(5).order('id desc').only(:where,:order)
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" WHERE (id < 3) ORDER BY id desc
 => 
[#<Author:0x000055e6f01f6a58
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
 #<Author:0x000055e6f01f6990
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



3)reselect
The reselect method overrides an existing select statement.
e.g->
[only reselect will run, select will not run]
> Author.select(:id,:name).reselect(:name)
  Author Load (0.4ms)  SELECT "authors"."name" FROM "authors"
 =>                                                                                                      
[#<Author:0x000055e6efeea8f0 id: nil, name: "rohit">,                                                    
 #<Author:0x000055e6efeea828 id: nil, name: "Ritika">,                                                   
 #<Author:0x000055e6efeea760 id: nil, name: "sonam">,                                                    
 #<Author:0x000055e6efeea698 id: nil, name: "rinku">,                                                    
 #<Author:0x000055e6efeea5a8 id: nil, name: "prince">,                                                   
 #<Author:0x000055e6efeea4e0 id: nil, name: "minku">,                                                    
 #<Author:0x000055e6efeea418 id: nil, name: "sunny">,                                                    
 #<Author:0x000055e6efeea328 id: nil, name: "sinku">,                                                    
 #<Author:0x000055e6efeea238 id: nil, name: "tinku">,                                                    
 #<Author:0x000055e6efeea170 id: nil, name: "rohit">,                                                    
 #<Author:0x000055e6efeea080 id: nil, name: "Sonu">,                                                     
 #<Author:0x000055e6efee9fb8 id: nil, name: "vishal">,                                                   
 #<Author:0x000055e6efee9e78 id: nil, name: "Reetu">,                                                    
 #<Author:0x000055e6efee9db0 id: nil, name: "meetu">,
 #<Author:0x000055e6efee9ce8 id: nil, name: "Seetu">] 




4)reorder
The reorder method overrides the default scope order.
e.g->
[only reorder will run,order will not run]
 > Author.select(:id).order("id DESC").reorder("id ASC")
  Author Load (0.4ms)  SELECT "authors"."id" FROM "authors" ORDER BY id ASC
 =>                                                                                
[#<Author:0x000055e6f0e61e00 id: 1>,                                               
 #<Author:0x000055e6f0e61ce8 id: 2>,                                               
 #<Author:0x000055e6f0e61bd0 id: 3>,                                               
 #<Author:0x000055e6f0e61b08 id: 4>,                                               
 #<Author:0x000055e6f0e61a40 id: 5>,                                               
 #<Author:0x000055e6f0e61978 id: 6>,                                               
 #<Author:0x000055e6f0e618b0 id: 7>,                                               
 #<Author:0x000055e6f0e61568 id: 8>,                                               
 #<Author:0x000055e6f0e61180 id: 9>,                                               
 #<Author:0x000055e6f0e60d98 id: 10>,                                              
 #<Author:0x000055e6f0e60b40 id: 15>,                                              
 #<Author:0x000055e6f0e60a78 id: 17>,                                              
 #<Author:0x000055e6f0e60870 id: 20>,                                              
 #<Author:0x000055e6f0e60708 id: 21>,
 #<Author:0x000055e6f0e60438 id: 22>] 


5)reverse_order
The reverse_order method reverses the ordering clause if specified.
e.g->
(without reverse order)
> Author.select(:id).where("id > 10")
  Author Load (0.8ms)  SELECT "authors"."id" FROM "authors" WHERE (id > 10)
 => [#<Author:0x000055e6f0d73f70 id: 15>, #<Author:0x000055e6f0d73e80 id: 17>, #<Author:0x000055e6f0d73d90 id: 20>, #<Author:0x000055e6f0d73ca0 id: 21>, #<Author:0x000055e6f0d73b88 id: 22>] 

(with reverse order)
> Author.select(:id).where("id > 10").reverse_order
  Author Load (0.4ms)  SELECT "authors"."id" FROM "authors" WHERE (id > 10) ORDER BY "authors"."id" DESC
 => [#<Author:0x000055e6f03a63d0 id: 22>, #<Author:0x000055e6f03a6308 id: 21>, #<Author:0x000055e6f03a6240 id: 20>, #<Author:0x000055e6f03a6178 id: 17>, #<Author:0x000055e6f03a60b0 id: 15>] 


6)rewhere
The rewhere method overrides an existing, named where condition.
e.g->
> Author.select(:id).where("id < 5").rewhere("id < 4")
  Author Load (0.8ms)  SELECT "authors"."id" FROM "authors" WHERE (id < 5) AND (id < 4)
 => [#<Author:0x00007f37e07ee360 id: 1>, #<Author:0x00007f37e07ee040 id: 2>, #<Author:0x00007f37e07edaa0 id: 3>] 

[where clauses are anded together.]
e.g->
> Author.select(:id).where("id < 5").where("id > 3")
  Author Load (0.4ms)  SELECT "authors"."id" FROM "authors" WHERE (id < 5) AND (id > 3)
 => [#<Author:0x000055e6f0505230 id: 4>] 


9)Null Relation
Book.none # returns an empty Relation and fires no queries.


10)readonly
Active Record provides the readonly method on a relation to explicitly disallow modification of any of the returned objects. Any attempt to alter a readonly record will not succeed, raising an ActiveRecord::ReadOnlyRecord exception.
e.g->
 > author=Author.readonly.find(5)
 > author.books_count+=1
 >author.save
 # Author is marked as readonly (ActiveRecord::ReadOnlyRecord)

11)Optimistic locking column
Optimistic locking allows multiple users to access the same record for edits, and assumes a minimum of conflicts with the data.

class AddColumnToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :lock_version, :integer
  end
end


12)pessimistic locking
Pessimistic locking uses a locking mechanism provided by the underlying database. Using lock when building a relation obtains an exclusive lock on the selected rows. Relations using lock are usually wrapped inside a transaction for preventing deadlock conditions.
e.g->
3.0.0 :302 > Book.transaction do
3.0.0 :303 >   book = Book.lock.find(2)
3.0.0 :304 >   book.title = 'about git'
3.0.0 :305 >   book.save!
3.0.0 :306 > end
  TRANSACTION (0.2ms)  BEGIN
  Book Load (0.3ms)  SELECT "books".* FROM "books" WHERE "books"."id" = $1 LIMIT $2 FOR UPDATE  [["id", 2], ["LIMIT", 1]]
  Book Update (0.3ms)  UPDATE "books" SET "updated_at" = $1, "title" = $2 WHERE "books"."id" = $3  [["updated_at", "2023-02-10 09:31:15.585495"], ["title", "about git"], ["id", 2]]
  TRANSACTION (8.4ms)  COMMIT
 => true


13)Joining Tables
Active Record provides two finder methods for specifying JOIN clauses on the resulting SQL: joins and left_outer_joins. While joins should be used for INNER JOIN or custom queries, left_outer_joins is used for queries using LEFT OUTER JOIN.

1) joins
There are multiple ways to use the joins method.

a) Using a String SQL Fragment
-You can just supply the raw SQL specifying the JOIN clause to joins:
e.g->
Author.joins("inner join books on books.author_id=author_id")
Author Load (0.6ms)  SELECT "authors".* FROM "authors" inner join books on books.author_id=author_id


b) Using Array/Hash of Named Associations
-Active Record lets you use the names of the associations defined on the model as a shortcut for specifying JOIN clauses for those associations when using the joins method.

All of the following will produce the expected join queries using INNER JOIN:
e.g->
> Author.joins(:books)
Author Load (1.3ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id"

-------to avoid duplicat data

> Author.joins(:books).distinct


c) Joining Multiple Associations
>Author.joins(:books,:orders)

d)Specifying Conditions on the Joined Tables
e.g->
> Author.joins(:books).where('author_id < 3')
  Author Load (0.6ms)  SELECT "authors".* FROM "authors" INNER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE (author_id < 3)
 => 
[#<Author:0x000055a36e712138
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
 #<Author:0x000055a36e70bce8
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



2)left_outer_joins
If you want to select a set of records whether or not they have associated records you can use the left_outer_joins method.

e.g->
> Author.left_outer_joins(:books).where("author_id < 2")
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" LEFT OUTER JOIN "books" ON "books"."author_id" = "authors"."id" WHERE (author_id < 2)
 =>                                                                          
[#<Author:0x00007f29a462d480                                                 
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


14)Eager Loading Associations
-Eager loading is the mechanism for loading the associated records of the objects returned by Model.find using as few queries as possible.
-----N + 1 queries problem

e.g->
> books = Book.limit(2)
>books.each do |book|
  puts book.author.name
end
[1 query for load books and then 2 queries to print their names.]

---------Solution to N + 1 queries problem

Active Record lets you specify in advance all the associations that are going to be loaded.

The methods are:

a)includes
b)preload
c)eager_load

a)includes

e.g->
 > books=Book.includes(:author).limit(2)
 > books.each do |book|
     puts book.author.name
    end

  Book Load (0.4ms)  SELECT "books".* FROM "books" LIMIT $1  [["LIMIT", 2]]
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2)  [["id", 15], ["id", 5]]

[only 2 queries will execute]


b)preload
e.g->
e.g->
 > books=Book.preload(:author).limit(2)
 > books.each do |book|
     puts book.author.name
    end

  Book Load (0.4ms)  SELECT "books".* FROM "books" LIMIT $1  [["LIMIT", 2]]
  Author Load (0.5ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2)  [["id", 15], ["id", 5]]

[only 2 queries will execute]


c)eager_load
With eager_load, Active Record loads all specified associations using a LEFT OUTER JOIN.

e.g->
> books=Book.eager_load(:author).limit(2)
  SQL (0.8ms)  SELECT "books"."id" AS t0_r0, "books"."name" AS t0_r1, "books"."created_at" AS t0_r2, "books"."updated_at" AS t0_r3, "books"."type" AS t0_r4, "books"."description" AS t0_r5, "books"."title" AS t0_r6, "books"."author_id" AS t0_r7, "books"."price" AS t0_r8, "authors"."id" AS t1_r0, "authors"."name" AS t1_r1, "authors"."created_at" AS t1_r2, "authors"."updated_at" AS t1_r3, "authors"."lock_version" AS t1_r4, "authors"."books_count" AS t1_r5, "authors"."address" AS t1_r6, "authors"."salary" AS t1_r7, "authors"."date_of_birth" AS t1_r8, "authors"."gender" AS t1_r9, "authors"."contact" AS t1_r10, "authors"."join_date" AS t1_r11, "authors"."resign_date" AS t1_r12 FROM "books" LEFT OUTER JOIN "authors" ON "authors"."id" = "books"."author_id" LIMIT $1  [["LIMIT", 2]]
 
15) Dynamic finders
-For every field (also known as an attribute) you define in your table, Active Record provides a finder method. If you have a field called first_name on    your Customer model for example, you get the instance method find_by_first_name for free from Active Record. 
-You can specify an exclamation point (!) on the end of the dynamic finders to get them to raise an ActiveRecord::RecordNotFound error if they do not return any records.
[if we want to find name and books count together then we can use and between them.]

e.g->
> Author.find_by_name_and_books_count("rohit",10)
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 AND "authors"."books_count" = $2 LIMIT $3  [["name", "rohit"], ["books_count", 10], ["LIMIT", 1]]
 => 
#<Author:0x000055a370ad78c0
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



16)find_or_create_by
It's common that you need to find a record or create it if it doesn't exist. You can do that with the find_or_create_by and find_or_create_by! methods.

e.g->
> Author.find_or_create_by(name: "vishal")
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 LIMIT $2  [["name", "vishal"], ["LIMIT", 1]]
 =>                                                           
#<Author:0x00007f29a43bad38                                   
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



----------find_or_create_by!
 ->You can also use find_or_create_by! to raise an exception if the new record is invalid. beacuse of not fulfilling the validation criteria.
e.g->
 > Author.find_or_create_by!(name: "jatin")
  Author Load (0.3ms)  SELECT "authors".* FROM "authors" WHERE "authors"."name" = $1 LIMIT $2  [["name", "jatin"], ["LIMIT", 1]]
/usr/share/rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4.2/lib/active_record/validations.rb:80:in `raise_validation_error': Validation failed: Gender can't be blank, Gender choose either male or female, Join date can't be blank (ActiveRecord::RecordInvalid) 

17)find_or_initialize_by
The find_or_initialize_by method will work just like find_or_create_by but it will call new instead of create. This means that a new model instance will be created in memory but won't be saved to the database.

e.g->
> author=Author.find_or_initialize_by(id:31,name:"jatin",gender:"male",join_date:"2021-11-11",resign_date:"2022-11-11")

  Author Load (0.7ms)  SELECT "authors".* FROM "authors" WHERE "authors"."id" = $1 AND "authors"."name" = $2 AND "authors"."gender" = $3 AND "authors"."join_date" = $4 AND "authors"."resign_date" = $5 LIMIT $6  [["id", 31], ["name", "jatin"], ["gender", "male"], ["join_date", "2021-11-11"], ["resign_date", "2022-11-11"], ["LIMIT", 1]]

 > author.save
  TRANSACTION (0.3ms)  BEGIN
  Author Create (8.1ms)  INSERT INTO "authors" ("id", "name", "created_at", "updated_at", "lock_version", "books_count", "address", "salary", "date_of_birth", "gender", "contact", "join_date", "resign_date") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING "id"  [["id", 31], ["name", "jatin"], ["created_at", "2023-02-10 11:11:23.940270"], ["updated_at", "2023-02-10 11:11:23.940270"], ["lock_version", 0], ["books_count", nil], ["address", nil], ["salary", nil], ["date_of_birth", nil], ["gender", "male"], ["contact", nil], ["join_date", "2021-11-11"], ["resign_date", "2022-11-11"]]                                                 
  TRANSACTION (1.7ms)  COMMIT                      
 => true              



18)Finding by sql
If you'd like to use your own SQL to find records in a table you can use find_by_sql. The find_by_sql method will return an array of objects even if the underlying query returns just a single record.

e.g->
> Author.find_by_sql("select id,name from authors where id = 3")
  Author Load (0.4ms)  select id,name from authors where id = 3
 => [#<Author:0x000055a3706bcbf0 id: 3, name: "sonam">]   


------------select_all
-find_by_sql has a close relative called "connection.select_all".
-select_all will retrieve objects from the database using custom SQL just like find_by_sql but will not instantiate them. This method will return an -instance of ActiveRecord::Result class and calling to_a on this object would return you an array of hashes where each hash indicates a record.

e.g->
 > Author.connection.select_all("select id,name from authors where id=4").to_a
   (0.8ms)  select id,name from authors where id=4
 => [{"id"=>4, "name"=>"rinku"}]                                                                                                             

-----------------pluck
pluck can be used to query single or multiple columns from the underlying table of a model. It accepts a list of column names as an argument and returns an array of values of the specified columns with the corresponding data type.

e.g->
> Author.pluck(:id,:name)
  Author Pluck (0.4ms)  SELECT "authors"."id", "authors"."name" FROM "authors"
 =>                                                                                                                                          
[[1, "rohit"],                                                                                                                               
 [2, "Ritika"],                                                                                                                              
 [3, "sonam"],                                                                                                                               
 [4, "rinku"],                                                                                                                               
 [5, "prince"],                                                                                                                              
 [6, "minku"],                                                                                                                               
 [7, "sunny"],                                                                                                                               
 [8, "sinku"],                                                                           
 [9, "tinku"],                                                                           
 [10, "rohit"],                                                                          
 [15, "Sonu"],
 [17, "vishal"],
 [20, "Reetu"],
 [21, "meetu"],
 [22, "Seetu"],
 [31, "jatin"]] 

 --------------ids
 e.g->
 > Book.ids
  Book Pluck (0.4ms)  SELECT "books"."id" FROM "books"
 => [3, 5, 6, 7, 2, 1]



19)Existence of objects
If you simply want to check for the existence of the object there's a method called exists?. This method will query the database using the same query as find, but instead of returning an object or collection of objects it will return either true or false.

e.g->
> Book.ids
  Book Pluck (0.4ms)  SELECT "books"."id" FROM "books"
 => [3, 5, 6, 7, 2, 1]                                      
3.0.0 :127 > Book.exists?(1)
  Book Exists? (0.4ms)  SELECT 1 AS one FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
 => true                                                    
3.0.0 :128 > Book.exists?(4)
  Book Exists? (0.4ms)  SELECT 1 AS one FROM "books" WHERE "books"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
 => false  

> Book.exists?(id:[1,2,3])
  Book Exists? (0.6ms)  SELECT 1 AS one FROM "books" WHERE "books"."id" IN ($1, $2, $3) LIMIT $4  [["id", 1], ["id", 2], ["id", 3], ["LIMIT", 1]]
 => true 

 > Book.exists?
  Book Exists? (0.3ms)  SELECT 1 AS one FROM "books" LIMIT $1  [["LIMIT", 1]]
 => true 
[return false if table empty otherwise true]

> Book.any?
  Book Exists? (0.4ms)  SELECT 1 AS one FROM "books" LIMIT $1  [["LIMIT", 1]]
 => true                                                    
> Book.many?
  Book Count (1.0ms)  SELECT COUNT(*) FROM (SELECT 1 AS one FROM "books" LIMIT $1) subquery_for_count  [["LIMIT", 2]]
 => true  

20)Calculations
 1)count
> Book.count
  Book Count (0.9ms)  SELECT COUNT(*) FROM "books"
 => 6                                                       

> Book.where(name:"Rails").count
  Book Count (0.5ms)  SELECT COUNT(*) FROM "books" WHERE "books"."name" = $1  [["name", "Rails"]]
 => 1

2)average
> Order.average("amount")
  Order Average (0.3ms)  SELECT AVG("orders"."amount") FROM "orders"
 => 0.70857142857142857143e4

 3)minimum
 > Order.minimum("amount")
  Order Minimum (0.5ms)  SELECT MIN("orders"."amount") FROM "orders"
 => 1200 

 4)maximum
 > Order.maximum("amount")
  Order Maximum (0.6ms)  SELECT MAX("orders"."amount") FROM "orders"
 => 10000 

 5)sum
 > Order.sum("amount")
  Order Sum (0.5ms)  SELECT SUM("orders"."amount") FROM "orders"
 => 99200 



21)Scope
-Scoping allows you to specify commonly-used queries which can be referenced as method calls on the association objects or models

e.g->
> Order.costs_less_than(2000)
  Order Load (0.3ms)  SELECT "orders".* FROM "orders" WHERE (amount < 2000)
 => 
[#<Order:0x00007f29a47debd0
  id: 1,
  card_number: "1234",
  created_at: Sat, 04 Feb 2023 04:51:37.289535000 UTC +00:00,
  updated_at: Sat, 04 Feb 2023 11:15:02.833991000 UTC +00:00,
  payment_type: "card",
  amount: 1200,
  status: true,
  book_id: 1>]

-------an association consisting of orders objects:
> book=Book.first
> book.orders.costs_less_than(2000)
  Order Load (0.5ms)  SELECT "orders".* FROM "orders" WHERE "orders"."book_id" = $1 AND (amount < 2000)  [["book_id", 1]]
 =>                                                                              
[#<Order:0x000055a37095db48                                                      
  id: 1,                                                                         
  card_number: "1234",                                                           
  created_at: Sat, 04 Feb 2023 04:51:37.289535000 UTC +00:00,                    
  updated_at: Sat, 04 Feb 2023 11:15:02.833991000 UTC +00:00,                    
  payment_type: "card",                                                          
  amount: 1200,                                                                  
  status: true,                                                                  
  book_id: 1>]

-------------default scope
If we wish for a scope to be applied across all queries to the model we can use the default_scope method within the model itself.
> book=Book.new(id:1)
 => #<Book:0x000055a370ac6660 id: 1, name: "no_name", created_at: nil, updated_at: nil, type: nil, description: nil, title: nil, author_id: nil, price: nil>

-------------Merging of scopes
e.g->
> Book.amount(150).id_of_author(5)
       or
> Book.amount(150).merge(Book.id_of_author(5))

  Book Load (0.3ms)  SELECT "books".* FROM "books" WHERE (price >= 150) AND (author_id < 5)
 =>                                                                                            
[#<Book:0x000055a370274390                                                                     
  id: 2,                                                                                       
  name: "Rails",                                                                               
  created_at: Thu, 02 Feb 2023 05:30:04.258029000 UTC +00:00,                                  
  updated_at: Fri, 10 Feb 2023 09:31:15.585495000 UTC +00:00,                                  
  type: nil,                                                                                   
  description: nil,                                                                            
  title: "about rails",               
  author_id: 2,                       
  price: 0.2e3>]

-----------------removing scopes
If we wish to remove scoping for any reason we can use the unscoped method. This is especially useful if a default_scope is specified in the model and should not be applied for this particular query.

Book.unscoped.load


22)Enum
An enum lets you define an Array of values for an attribute and refer to them by name. The actual value stored in the database is an integer that has been mapped to one of the values.

Declaring an enum will:

Create scopes that can be used to find all objects that have or do not have one of the enum values
Create an instance method that can be used to determine if an object has a particular value for the enum
Create an instance method that can be used to change the enum value of an object
for all possible values of an enum.

-----------Accessing status
 >order = Order.first
 > order.completed?
 => true 

 >order = Order.find(2)
 > order.completed?
 => false 
3.0.0 :235 > order.initial?
 => true 

 ----------update
 [now order id 2 is completed]
 >order = Order.find(2)
 > order.completed!
  TRANSACTION (0.6ms)  BEGIN
  Order Update (1.0ms)  UPDATE "orders" SET "updated_at" = $1, "status" = $2 WHERE "orders"."id" = $3  [["updated_at", "2023-02-10 13:07:24.016303"], ["status", 1], ["id", 2]]
  TRANSACTION (8.8ms)  COMMIT                                      
 => true 



-----------------Layouts and rendering in rails

-->Creating Responses

From the controller's point of view, there are three ways to create an HTTP response:

-Call render to create a full response to send back to the browser
-Call redirect_to to send an HTTP redirect status code to the browser
-Call head to create a response consisting solely of HTTP headers to send back to the browser

--->Rendering by Default: Convention Over Configuration in Action

-->By default, controllers in Rails automatically render views with names that correspond to valid routes.
[Rails will automatically render app/views/books/index.html.erb when you navigate to /books ]

Note :-
[That we don't have explicit render at the end of the index action in accordance with "convention over configuration" principle. The rule is that if you do not explicitly render something at the end of a controller action, Rails will automatically look for the action_name.html.erb template in the controller's view path and render it. So in this case, Rails will render the app/views/books/index.html.erb file.]



-->rails server
ouptut->

Listing Books
name	price	
python	300.0
CN	100.0
english	100.0
OS	100.0
git	100.0
Rails	200.0

---------->Rendering an Action's View
If you want to render the view that corresponds to a different template within the same controller, you can use render with the name of the view:

------------>Using render with :inline
The render method can do without a view completely, if you're willing to use the :inline option to supply ERB as part of the method call.

------------> Rendering Text
You can send plain text - with no markup at all - back to the browser by using the :plain option to render:

----------->Rendering HTML
You can send an HTML string back to the browser by using the :html option to render

---------->Rendering JSON
JSON is a JavaScript data format used by many Ajax libraries. Rails has built-in support for converting objects to JSON and rendering that JSON back to the browser:

render json: @book

----------> Rendering XML
Rails also has built-in support for converting objects to XML and rendering that XML back to the caller:

--------->Rendering raw body
You can send a raw content back to the browser, without setting any content type, by using the :body option to render:

render body: "raw"


---------------------------------------------------------------------------------------------------------------------------------------------------------------->Finding Layouts

To find the current layout, Rails first looks for a file in app/views/layouts with the same base name as the controller.
or we can override the layout by declare in controller.

-->to  assign a specific layout for the entire application, use a layout declaration in your ApplicationController class:


---->Conditional Layouts

Layouts specified at the controller level support the :only and :except options. These options take either a method name, or an array of method names, corresponding to method names within the controller:

------->Render and redirect

-Redirect is a method that is used to issue the error message in case the page is not found or it issues a 302 to the browser. Whereas, render is a method used to create the content.

-Redirect is used to tell the browser to issue a new request. Whereas, render only works in case the controller is being set up properly with the variables that needs to be rendered.

-Redirect is used when the user needs to redirect its response to some other page or URL. Whereas, render method renders a page and generate a code of 200.

-Redirect is used as:
redirect_to: controller => ‘users’, :action => ‘new’

-Render is used as:
render: partial
render: new -> this will call the template named as new.rhtml without the need of redirecting it to the new action.

------->Using head To Build Header-Only Responses
The head method can be used to send responses with only headers to the browser. The head method accepts a number or symbol representing an HTTP status code.

----> Asset Tag Helpers

Asset tag helpers provide methods for generating HTML that link views to feeds, JavaScript, stylesheets, images, videos, and audios. There are six asset tag helpers available in Rails:

auto_discovery_link_tag
javascript_include_tag
stylesheet_link_tag
image_tag
video_tag
audio_tag
You can use these tags in layouts or other views, although the auto_discovery_link_tag, javascript_include_tag, and stylesheet_link_tag, are most commonly used in the <head> section of a layout.

----> Linking to Feeds with the auto_discovery_link_tag
The auto_discovery_link_tag helper builds HTML that most browsers and feed readers can use to detect the presence of RSS, Atom, or JSON feeds.

----> Linking to JavaScript Files with the javascript_include_tag
The javascript_include_tag helper returns an HTML script tag for each source provided.

If you are using Rails with the Asset Pipeline enabled, this helper will generate a link to /assets/javascripts/ rather than public/javascripts which was used in earlier versions of Rails. This link is then served by the asset pipeline.

---->Linking to CSS Files with the stylesheet_link_tag
The stylesheet_link_tag helper returns an HTML <link> tag for each source provided.

If you are using Rails with the "Asset Pipeline" enabled, this helper will generate a link to /assets/stylesheets/. This link is then processed by the Sprockets gem. A stylesheet file can be stored in one of three locations: app/assets, lib/assets, or vendor/assets.

---->Linking to Images with the image_tag
The image_tag helper builds an HTML <img /> tag to the specified file. By default, files are loaded from public/images.
e.g-><%= image_tag "book.jpg", {height: 45} %>

----> Linking to Videos with the video_tag
The video_tag helper builds an HTML5 <video> tag to the specified file. By default, files are loaded from public/videos.
 e.g-><%= video_tag "book_video.mp4", size: "200x200", autoplay: :autoplay, controls: :true, loop: :loop, autobuffer: true  %>

---->Linking to Audio Files with the audio_tag
The audio_tag helper builds an HTML5 <audio> tag to the specified file. By default, files are loaded from public/audios
e.g-><%= audio_tag "audiobook.mp3", autoplay: :autoplay, loop: :loop, controls: :true%> 

------------>yield
The simplest way to use this is to have a single yield, into which the entire contents of the view currently being rendered is inserted:

<html>
  <head>
  </head>
  <body>
  <%= yield %>
  </body>
</html>

You can also create a layout with multiple yielding regions:

<html>
  <head>
  <%= yield :head %>
  </head>
  <body>
  <%= yield %>
  </body>
</html>

----------->content_for
The content_for method allows you to insert content into a named yield block in your layout. For example, this view would work with the layout that you just saw:

<% content_for :head do %>
  <title>A simple page</title>
<% end %>

<p>Hello, Rails!</p>

The result of rendering this page into the supplied layout would be this HTML:

<html>
  <head>
  <title>A simple page</title>
  </head>
  <body>
  <p>Hello, Rails!</p>
  </body>
</html>
Copy
The content_for method is very helpful when your layout contains distinct regions such as sidebars and footers that should get their own blocks of content inserted. It's also useful for inserting tags that load page-specific JavaScript or CSS files into the header of an otherwise generic layout.



-------------->Using Partials
Partial templates - usually just called "partials" - are another device for breaking the rendering process into more manageable chunks. With a partial, you can move the code for rendering a particular piece of a response to its own file.
if we want to share the code in multiple files like same form for editing and inserting new books then we can create a form partial and render that in both templates.

[partials are named as _form.html.erb using underscore]
<%= render "form" %>


------------->partial layouts
Partial Layouts
A partial can use its own layout file, just as a view can use a layout. For example, you might call a partial like this:
<%= render partial: "form", layout: "form_layout" %>

[Note that layouts for partials follow the same leading-underscore naming as regular partials, and are placed in the same folder with the partial that they belong to (not in the master layouts folder).]



---------> Rendering Collections
Partials are very useful in rendering collections. When you pass a collection to a partial via the :collection option, the partial will be inserted once for each member in the collection:



----------->Collection partial layouts
The layout will be rendered together with the partial for each item in the collection. The current object and object_counter variables will be available in the layout as well, the same way they are within the partial.


--------------Action View Form Helpers--------------------------------------------
--->form_with
<%= form_with do |form| %>
 form content
<% end %>

<form action="/books/3/edit" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="cXcLQBxcuHJaj6Ra5QM_ws_9Wur4vbGHMhck9wcOYslErZkYd9o_iQm72geYUZB2L5gtFgN6cM5ShpHF1gMS7Q" autocomplete="off" />
</form>  



--->checkbox
Checkboxes are form controls that give the user a set of options they can enable or disable:

<%= form_with do |form| %>
<%= form.check_box :read_book %>
<%= form.label :read_book, "read book" %>
<%= form.check_box :add_book %>
<%= form.label :add_book, "add book" %>
<% end %>

<form action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="emubK4bzbDbbrsaaxUGiRB-HUq3BkQQj7j7DAlUDNidMCK-uL0x1MMo1OUKxsHEmtG4iVW3I9V6yMs7qYVO3xQ" autocomplete="off" />
<input name="read_book" type="hidden" value="0" autocomplete="off" /><input type="checkbox" value="1" name="read_book" id="read_book" />
<label for="read_book">read book</label>
<input name="add_book" type="hidden" value="0" autocomplete="off" /><input type="checkbox" value="1" name="add_book" id="add_book" />
<label for="add_book">add book</label>
</form>  


--->RadioButton
Radio buttons, while similar to checkboxes, are controls that specify a set of options in which they are mutually exclusive (i.e., the user can only pick one):

<%= form_with do |form| %>
<%= form.radio_button :age, "child" %>
<%= form.label :age_child, "I am younger than 21" %>
<%= form.radio_button :age, "adult" %>
<%= form.label :age_adult, "I am over 21" %>
<% end %>


<form action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="N9nTPIE6RllfWtcreYFB2bV5pLiLBX0bDidPskO_2f8Buue5KIVfX07BKPMNcJK7HpDUQCdcjGZSK0Jad-9YHQ" autocomplete="off" />
<input type="radio" value="child" name="age" id="age_child" />
<label for="age_child">I am younger than 21</label>
<input type="radio" value="adult" name="age" id="age_adult" />
<label for="age_adult">I am over 21</label>
</form> 

--->other helpers
<%= form_with do |form| %>
<%= form.text_area :message, size: "70x5" %>
<%= form.hidden_field :parent_id, value: "foo" %>
<%= form.password_field :password %>
<%= form.number_field :price, in: 1.0..20.0, step: 0.5 %>
<%= form.range_field :discount, in: 1..100 %>
<%= form.date_field :born_on %>
<%= form.time_field :started_at %>
<%= form.datetime_local_field :graduation_day %>
<%= form.month_field :birthday_month %>
<%= form.week_field :birthday_week %>
<%= form.search_field :name %>
<%= form.email_field :address %>
<%= form.telephone_field :phone %>
<%= form.url_field :homepage %>
<%= form.color_field :favorite_color %>
<% end %>

<form action="/books/3" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="YeqkJ2FihwRqOE-hoWMznzTzDVhDWdjLLh9H2FryYk4IXkcMKnwp5JWRhP9iLLkTrI_NzwgpYkVyprqNUaJj5A" autocomplete="off" />
<textarea name="message" id="message" cols="70" rows="5">
</textarea>
<input value="foo" autocomplete="off" type="hidden" name="parent_id" id="parent_id" />
<input type="password" name="password" id="password" />
<input step="0.5" min="1.0" max="20.0" type="number" name="price" id="price" />
<input min="1" max="100" type="range" name="discount" id="discount" />
<input type="date" name="born_on" id="born_on" />
<input type="time" name="started_at" id="started_at" />
<input type="datetime-local" name="graduation_day" id="graduation_day" />
<input type="month" name="birthday_month" id="birthday_month" />
<input type="week" name="birthday_week" id="birthday_week" />
<input type="search" name="name" id="name" />
<input type="email" name="address" id="address" />
<input type="tel" name="phone" id="phone" />
<input type="url" name="homepage" id="homepage" />
<input value="#000000" type="color" name="favorite_color" id="favorite_color" />
</form>  


--->Binding a Form to an Object
The :model argument of form_with allows us to bind the form builder object to a model object.
for e.g if we click on any book to show then form will have that values.

[in show template]
<%= form_with model: @book do |form| %>
  <%= form.text_field :name %>
  <%= form.text_field :price %>
  <%= form.submit %>
<% end %>

<form action="/books/1" accept-charset="UTF-8" method="post"><input type="hidden" name="_method" value="patch" autocomplete="off" /><input type="hidden" name="authenticity_token" value="OBvPbZp1_IQA_MuZLltijJHUF1JIaqYBVaoqAhlnFV-ra7wt7vCXIpwqxJcpZ4Cn8QfPLf4Fsa8Iky2zDdXGag" autocomplete="off" />
  <input type="text" value="git" name="book[name]" id="book_name" />
  <input type="text" value="100.0" name="book[price]" id="book_price" />
  <input type="submit" name="commit" value="Update Book" data-disable-with="Update Book" />
</form>  


--->The fields_for Helper
The fields_for helper creates a similar binding but without rendering a <form> tag. This can be used to render fields for additional model objects within the same form.
for e.g-> we have associations between model book and author,se we can show book and author name in a single form.

<%= form_with model: @book do |book_form| %>
  <%= book_form.text_field :name %>
  <%= fields_for :author, @book.author do |author_form| %>
    <%= author_form.text_field :name %>
  <% end %>
<% end %>


<form action="/books/1" accept-charset="UTF-8" method="post"><input type="hidden" name="_method" value="patch" autocomplete="off" /><input type="hidden" name="authenticity_token" value="_WjZH8X7a5Xf0Qvju1SMKXiCoqZtjk_J_vIaKCN7wIBuGKpfsX4AM0MHBO28aG4CGFF62dvhWGejyx2ZN8kTtQ" autocomplete="off" />
  <input type="text" value="git" name="book[name]" id="book_name" />
  
    <input type="text" value="rohit" name="author[name]" id="author_name" />
</form> 



--->select boxes
<%= form_with do |form| %>
<%= form.select :city, ["Faridabad", "Delhi"] %>
<% end %>

<form action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="qn1jvyyYFEBnCOcoVb_8_tKHVzUQFinPw_AWSvpbgKycHlc6hScNRnaTGPAhTi-ceW4nzbxP2LKf_BuizgsBTg" autocomplete="off" />
<select name="city" id="city"><option value="Faridabad">Faridabad</option>
<option value="Delhi">Delhi</option></select>
</form> 

--->We can also designate <option> values that differ from their labels:
<%= form_with do |form| %>
<%= form.select :city, [["Faridabad", "F"],["Delhi", "D"]] %>
<% end %>

<form action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="WSyMpN0MszFIigWK8nJXr-jJ_QYmKsC3MasRcyIhQipvT7ghdLOqN1kR-lKGg4TNQyCN_opzMcptpxybFnHDyA" autocomplete="off" />
<select name="city" id="city"><option value="F">Faridabad</option>
<option value="D">Delhi</option></select>
</form> 

--->option groups
In some cases we may want to improve the user experience by grouping related options together. We can do so by passing a Hash (or comparable Array) to select:

<%= form_with do |form|%>
<%= form.select :city,
      {
        "Faridabad" => ["sector-1","sector-2" ],
        "Delhi" =>  ["sector-1","sector-2"],
      },
      selected: "sector-1" %>
      <% end %>

<form action="/books" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="cZVXn0LMXkv0UbH9s9rE5WsTm-Ebm7pckead5lViQF5H9mMa63NHTeXKTiXHKxeHwPrrGbfCSyHN6pAOYTLBvA" autocomplete="off" />
<select name="city" id="city"><optgroup label="Faridabad"><option selected="selected" value="sector-1">sector-1</option>
<option value="sector-2">sector-2</option></optgroup><optgroup label="Delhi"><option selected="selected" value="sector-1">sector-1</option>
<option value="sector-2">sector-2</option></optgroup></select>
      </form> 

--->Select Boxes and Model Objects
Like other form controls, a select box can be bound to a model attribute.
for e.g we have an book object then we can select its title in a form.

[in show template]
<%= form_with model: @book do |book_form| %>
<%= book_form.select :title, ["just started","learn more"]%>
<% end %>

<form action="/books/1" accept-charset="UTF-8" method="post"><input type="hidden" name="_method" value="patch" autocomplete="off" /><input type="hidden" name="authenticity_token" value="2-5fCY-YSaPhN5uE_JjGjZy0Yz1pvAR5CaG-i9AgNYZInixJ-x0iBX3hlIr7pCSm_Ge7Qt_TE9dUmLk6xJLmsw" autocomplete="off" />
<select name="book[title]" id="book_title"><option value="just started">just started</option>
<option value="learn more">learn more</option></select>
</form>

--->time zone select
<%= form_with do |form| %>
<%= form.time_zone_select :time_zone %>
<% end %>

----------Date and Time form helpers
These helpers render a select box for each temporal component (e.g. year, month, day, etc)

-->date_select
<%= form_with model: @book do |form| %>
<%= form.date_select :updated_at %>
<% end %>

-->time_select
<%= form_with model: @book do |form| %>
<%= form.time_select :updated_at %>
<% end %>

-->datetime_select
<%= form_with model: @book do |form| %>
<%= form.datetime_select :updated_at %>
<% end %>

-->select year only
<%= select_year 1999 %>

-->select minth only
<%= select_month 10 %>

-->select day only
<%= select_day 19 %>










