
--> We get a lot of benefits when we introduce services to encapsulate business logic, including the following:

-Lean Rails controller - The controller is only responsible for understanding requests and turning the request params, sessions, and cookies into arguments that are passed into the service object to act. The controller then redirects or renders according to the service response. Even in large applications, controller actions using service objects are usually not more than 10 lines of code.

-Testable controllers - Since the controllers are lean and serve as collaborators to the service, it becomes really easy to test, as we can only check whether certain methods within the controller are called when a certain action occurs.

-Ability to test business process in isolation - Services are easy and fast to test since they are small Ruby objects that have been separated from their environment. We can easily stub all collaborators and only check whether certain steps are performed within our service.

-Re-usable services - Service objects can be called by controllers, other service objects, queued jobs, etc.

-Separation between the framework and business domain - Rails controllers only see services and interact with the domain object using them. This decrease in coupling makes scalability easier, especially when you want to move from a monolith to a microservice. Your services can easily be extracted and moved to a new service with minimal modification.