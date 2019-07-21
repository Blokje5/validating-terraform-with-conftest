# Validating Terraform plans using the Open Policy Agent

This repository contains the code for the blog post here: https://blokje5.dev/posts/validating-terraform-plans/

## Requirements

The following tools are needed in order to execute the code:

- [Terraform](https://www.terraform.io/)
- [Conftest](https://github.com/instrumenta/conftest)

Additionally, if you want to execute the [unit tests](https://www.openpolicyagent.org/docs/latest/how-do-i-test-policies/) for the policies, the [OPA binary](https://github.com/open-policy-agent/opa/releases) needs to be installed.

## Generating a terraform plan

execute the following commands (note that valid AWS credentials need to be available, as we are deploying AWS resources).
 
```bash
terraform init
terraform plan -out=tfplan
terraform show -json ./tfplan > tfplan.json
```

## Evaluating the plan

```bash
conftest test ./tfplan.json
```

Which returns the following output:

```bash
./tfplan.json
   Invalid tags (missing minimum required tags) for the following resources: ["aws_s3_bucket.helm_repo"]
   Invalid tags (not pascal case) for the following resources: ["aws_s3_bucket.terraform_state_bucket"]
```

## Unit testing Rego policies

```bash
cd policy
opa test -v *.rego
```
