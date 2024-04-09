vpc_name        = "my-vpc"
cidr            = "10.0.0.0/16"
azs             = ["us-east-1a", "us-east-1b"]
private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

ecr_names = [
    "spring-boot-template"
]

eks_cluster_name = "my-eks"

db_cluster_name  = "my-db"
db_instance_name = "my-db"
db_username      = "admin"
db_password      = "admin"
