1) What type of infrastructure and application deployments are each tool best suited for?
    Serverless Framework
    - Optimized for serverless application such as AWS lambda, API Gateway, DynamoDB etc. Ideal for event driven or microservices application. 

    Terraform 
    - Best used for managing complete cloud infrastucture across multiple providers such as AWS, Azure, google cloud. ideal for networking, database, compute, IAM etc. 

2) How do their primary objective differ?
    Serverless Framework
    - Focuses on simplifying deployment and management of serverless applications, abstracting much of the infrastructure details.

    Terraform 
    - Focuses on provisioning infrastructure as code in a declarative and provider-agnostic manner with a heavy emphasis on reproducibility and infra liftcycle management. 

3) How do they differ in terms of learning curve and ease of use for developers and devops team?
    Serverless Framework
    - Learning Curve would be easier for developers esp those working on serverless stack such as YAML and Plugins. 
    - While ease of use is very developer-freidnly as it abstracts alot such as by creating an api with functions.

    Terraform 
    - Learning curve would be steeper due to Hashicorp confi language and the complexity of resources
    - Ease of use would be more verbose and explicit. Ideally good for large teams and enterprise grade infra

4) What are the differences in how each tool handles state tracking and deployment changes
    Serverless Framwork 
    - For State tracking, implicit as it often relies on cloud providers state such as CloudFormation in AWS

    - For deployment changes, Less granular as changes are abstracted. May redeploy entire function or stack

    Terraform 
    - For state tracking, maintains a local/remote state file to track actual deployed resources (terraform.tfstate)

    - For deployment changes, detailed and explicit with plan and apply model to previous and perform control change. 

5) In what scenarios would you recommend using Serverless Framework over terraform and vice versa?
    Serverless framework
    - When you are building serverless application such as Lambda, API or gateway. Ideally want to focus on quick deployment and function logic and not infrastructure.

    Terraform 
    - Use when in need for full control of infrastructure including VPC, IAM, Database. Ideally want to focus on managing complex multi-tier infra/require multi-cloud support. 

6) Are there scenarios where using both together might be beneficial?
    - Yes, Terraform can provide underlying infrastructure such as VPC, subnet, S3 bucket while serverless framework deploys and manage application level resources like lambda function, api gateway and triggers. 

