1) Does SNS guarantee exactly once delivery to subscribers?
    - No, SNS doesnt guarantee exactly once delivery. instead it guarantees at least once delivery where the message will be delivered at least once to each subscribed endpoint. Duplicated message may occur in cases of retries or transient errors.

2) What is the purpose of the Dead-letter Queue(DLQ)? This is a feature available to SQS/SNS/Eventbridge.
    - DLQ captures messages that cant be successfully processed after a number of delivery attempts. This could be due to message for SQS failed processing due to consumer errors or timeout after the config maxreceivecount are moved to DLQ. For SNS, DLQ captures undeliverable message when SNS subscriber fails to acknowledge receipts. DLQ is used to de ug failed deliverables and isolate faulty messages from main queue/pipeline. Isolated faulty message can be retried or manually process later. 

3) How would you enable a notification to your email when message are added to the DLQ?
    - Ensure SNS topic is created, subscribe your email to SNS topic and click confirm subscription from the email inbox. Next create lambda function to process message from DLQ and public to SNS topic. Lastly to grant lambda permission to read message from DLQ and publish to SNS topic using the IAM role. 