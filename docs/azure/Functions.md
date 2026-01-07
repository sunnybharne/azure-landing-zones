### Azure functions
    - Trigger
        - Storage: You can listen for events from databases like Azure Cosmos DB. For example, when a new row is inserted.
        - Events: Event Grid and Event Hubs produce events that can trigger your code.
        - HTTP code: Web requests and webhooks can trigger HTTP code.
        - Queues: Queue messages can be processed, as well.
        - Timer: Invoke code based on a specified time interval.
    - bindings 
Use bindings to connect to data sources

Bindings are ways to simplify coding for input and output data. While you can use a client SDK to connect to services from your function code, Azure Functions provides bindings to simplify these connections. Essentially, bindings are connection code you don’t have to write. You can integrate with many services on Azure and solve integration problems and automate business processes.

Bindings come in two flavors, input, and output. An output binding provides a way to write data to the data destination; for example, placing a message on a queue or a new row in a database. An input binding can be used to pass data to your function from a data source different than the one that triggered the function.
Features

There are some features that makes Azure Functions a compelling choice:

    Flexible hosting plans. There are three different hosting plans to fit your business needs.
        Consumption plan. A fully serverless hosting option for Functions. Functions scale automatically, and you pay for compute resources only when your functions are running. This plan provides cost-efficient compute for short process workloads that tend to be more intermittent with less-predictable loads.
        Premium plan. In this plan, your functions are kept initialized, meaning there’s no delay after being idle. The Premium plan is a good plan to choose when your function app needs to run for longer periods, but you still need the dynamic scale. This plan also lets you start scaling with more resources faster than with the Consumption plan. In the Consumption plan there’s also limits on the execution time, which this plan can supersede. While you still get the cost benefits of dynamic scale, you pay more.
        Dedicated plan. You run your functions with a regular App Service plan. It’s best for scenarios where your functions need to run continuously. Another benefit is that you fully control how the app scales and can more easily predict costs. A Dedicated plan is also a good choice when you have an existing but underutilized App Service plan available.

    Dynamic scaling. In most plans, functions are dynamically scaled based on load. When demand of execution increases, more resources are allocated automatically to the service and when requests fall, resources and application instances drop off automatically. In Consumption plan, you don’t pay at all for idle functions.

    Event based architecture. Functions are meant to be small and focused. They process incoming data and are done or raise a new event in turn. Some common usage areas of Azure functions are sending emails, starting backup, order processing, task scheduling such as database clean-up, sending notifications, messages, and IoT data processing.
    - durable functions 
    - long running functions 
    - premium or dedicated host option
    - Host pools 
    - Create vm inside host pool (the user need to have Licence in entra id 
    - Create a workspace 
    - Assign the user to the host pool 

### Features
    1. Options
        - Code 
        - Container
    2. Plans
        - Consumption plan
        - Premium plan
        - App service plan
    3. Functions needs storage account
    4. Functaion app can contain multiple functions
    5. Triggers
        - HTTP
        - Timer
        - Blob
        - Queue
        - Event grid
        - Service bus
    6. Bindings
        - Input
        - Output
    7. Authorization level
        - Function
        - Anonymous(Do not require any security)
        - Admin
    8. Code + Test (Section) , here you can develop the function and test it.
    9. Function.json(Contains the bindings and triggers)

##### Deployment types:
    - code ( some famous languages , choose custom handler for not listed ones )
    - Containers  
    Hosting plan:
    - How many resources can be scaled and how much can it scale
    1. Consumption plan - server less
    3. Function premium 
    5. App service plan - use the existing app service plan

    - Function needs a storage account to store the files
    - Public access can be turned off and can be attached to a virtual network( premium or app service plan needed ) 
    - CICD can be done as needed 
    - Monitoring can be turned on as per need. 
    - Functions can be created in the portal itself
    - Functions have trigger. 
    - Functions also have  bindings

