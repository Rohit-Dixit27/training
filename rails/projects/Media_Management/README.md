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