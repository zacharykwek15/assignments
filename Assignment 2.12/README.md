Given a Lambda function that is triggered upon the creation of files in an S3 bucket, answer the following:
1) What is the purpose of the execution role on the Lambda function?

Ans: The execution role (IAM) grants the lambda function permission to interact with other AWS service on behalf of the function. It would allot the function to read from S3 bucket, Write to S3, Log onto cloudwatch. 


2) What is the purpose of the resource-based policy on the Lambda function?

Ans: Resource based policy allows other AWS Services (like S3) to invoke the lambda function. For example, data upload performed on S3 will trigger lambda function when a new object is created in the bucket.

3) If the function is needed to upload a file into an S3 bucket, describe (i.e no need for the actual policies)
 

     - What is the needed update on the execution role?
 
        Ans: We will need to allow permission in the IAM Role under 
        "effect" : "Allow"
        "Action": "s3:PutObject"

      
     - What is the new resource-based policy that needs to be added (if any)?

        Ans: No new resource based policy is needed as it is used to allow lambda to be invoked by other services (triggered by the servies). Since in this case the Lambda is initiating the S3 action, it is covered entirely by the execution role. 
 