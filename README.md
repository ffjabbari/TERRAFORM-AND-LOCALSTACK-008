
THIS REALLY REALLY WORKS FRED, PERFECT.  VERY COMPLEX AND WORKS....

Last login: Sun Apr  7 10:07:21 on ttys019
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ localstack stop    
container stopped: localstack-main
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3api list-buckets
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3api list-buckets
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3 mb s3//fred01-bucket

<S3Uri>
Error: Invalid argument type
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3 mb s3://fred01-bucket     252 ↵
make_bucket: fred01-bucket
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3api list-buckets      
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3 mb s3//fred02-bucket 

<S3Uri>
Error: Invalid argument type
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3 mb s3://fred02-bucket     252 ↵
make_bucket: fred02-bucket
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ aws --endpoint-url=http://localhost:4566 s3api list-buckets      
╭─fjabbari@Freds-MacBook-Pro ~ 
╰─$ 


# terraform-aws-localstack

Good evening, everybody, and welcome to the `terraform-aws-localstack` repository where everything is more confusing
than IKEA assembly instructions and the errors are treated like decorations. That's right, the infrastructure is like
socks in a dryer - it just disappears for no reason!

Terraform + AWS / LocalStack

## :memo: Prerequisites

* Docker
* [Helm](https://helm.sh/docs/intro/install/)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [`awscli-local`](https://github.com/localstack/awscli-local)
* [`terraform-local`](https://github.com/localstack/terraform-local)
* [pre-commit](https://github.com/pre-commit/pre-commit-hooks) - required only for staging changes to the repository

For :apple: macOS users, you can use the [`Brewfile`](Brewfile) script to simplify the installation of all the
necessary dependencies.

If you have Homebrew installed, follow these steps:

```bash
brew bundle
```

## :rocket: Getting Started

### :house: LocalStack

* Install LocalStack AWS CLI (`awslocal`) and `tflocal`

* Run LocalStack:

    * :free: Community:

      ```bash
      docker-compose -f localstack-compose.yml up
      ```

    * :money_with_wings: Pro:

      required, for example, for the EKS component. more
      info: [LocalStack Coverage](https://docs.localstack.cloud/references/coverage/)

      :warning: You need to provide `LOCALSTACK_API_KEY` value.

      ```bash
      # Set up the API Key
      export LOCALSTACK_API_KEY=<your-api-key>

      # Run LocalStack Pro
      docker-compose -f localstack-pro-compose.yml up
      ```

* Initialize Terraform:

```bash
tflocal init
```

* Generate Terraform plan:

```bash
tflocal plan
```

* Apply Terraform configuration:

```bash
tflocal apply -auto-approve
```

### :cloud: AWS

* Create S3 state bucket

```bash
aws s3api create-bucket --bucket tf-state
```

* Initialize Terraform:

```bash
terraform init
```

* Generate Terraform plan:

```bash
terraform plan
```

* Apply Terraform configuration:

```bash
terraform apply -auto-approve
```

### :wheel_of_dharma: Helm

Use my another git repository [spring-boot-template](https://github.com/lomasz/spring-boot-template) as example of Helm
chart.

## Connecting to EKS on LocalStack using `kubectl`

**1. Update kubeconfig for EKS Cluster**

First, you need to add the `my-eks` cluster information to your `~/.kube/config` to enable `kubectl` to know where your
cluster is and how to access it.

```bash
awslocal eks update-kubeconfig --name my-eks
```

**2. Configure AWS CLI for LocalStack**

Before interacting with LocalStack, configure the AWS CLI to use dummy credentials.
Though LocalStack doesn't validate these credentials, it expects them to be set.

Run the configuration command:

```bash
aws configure
```

When the AWS CLI prompts you for the credentials, use dummy credentials:

```bash
AWS Access Key ID [None]: test
AWS Secret Access Key [None]: test
```

**3. Set current k8s context**

```
kubectx arn:aws:eks:us-east-1:000000000000:cluster/my-eks
```

**4. Validate kubectl Configuration**

List resources across all namespaces to validate the connection:

```bash
kubectl get all -A
```
