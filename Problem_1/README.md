Prerequisite -

1. S3 bucket should needs to be created before executing the terraform code . Bucket name should be ""
2. DynamoDB Table should needs to be created before executing the terraform code . Table name should be ""

To create the infrastructure on the aws , run below commands 

1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply (when asked to enter the value type "yes")

To destroy the infrastructure on the aws , run below commands

1. terraform destroy (when asked to enter the value type "yes")




