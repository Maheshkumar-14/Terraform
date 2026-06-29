--- MODULES ---

A Terraform module is a collection of Terraform configuration files (.tf files) that are grouped together to perform a specific task. Modules help organize, reuse, and manage infrastructure code efficiently.

In simple terms, a module is like a reusable building block. Instead of writing the same Terraform code multiple times, you write it once in a module and use it wherever needed.

--- Advantages ---

Code Reusability – Write the infrastructure code once and reuse it in multiple projects.
Better Organization – Separate resources such as VPC, EC2, Security Groups, and Load Balancers into different modules.
Easy Maintenance – Changes made inside a module are automatically reflected wherever that module is used.
Consistency – Ensures the same infrastructure configuration is deployed across different environments (Development, Testing, Production).
Scalability – Makes it easier to manage large and complex infrastructure projects.
Collaboration – Different team members can work on different modules independently.

## Root main.tf

Acts as the entry point of the project.

Its responsibilities are:

* Calls the VPC module
* Calls the Security Group module
* Calls the EC2 module
* Passes outputs from one module as inputs to another module

Example flow:

```
VPC Module
     │
     ▼
Security Group Module
     │
     ▼
EC2 Module
--------------

## variables.tf

Declares all input variables used in the root module.

Examples:

* AWS Region
* AMI ID
* Instance Type
* VPC CIDR Block
* Public Subnet CIDR
* Private Subnet CIDR

These variables make the project reusable.

---

## terraform.tfvars

Contains the actual values assigned to variables.

Example:

```hcl
region = "ap-south-1"

ami_id = "ami-xxxxxxxx"

instance_type = "t2.micro"

vpc_cidr = "10.0.0.0/16"
```

Separating values from code makes it easier to reuse the same project in different environments.

# Modules

## VPC Module

### Purpose

Creates the networking infrastructure.

Resources Created

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association

Outputs

* VPC ID
* Public Subnet ID

These outputs are used by other modules.

---

## Security Group Module

### Purpose

Creates a Security Group inside the VPC.

The Security Group allows inbound and outbound traffic based on configured rules.

Example:

* SSH (22)
* HTTP (80)
* HTTPS (443)

Input

* VPC ID

Output

* Security Group ID

The EC2 module uses this Security Group ID.

---

## EC2 Module

### Purpose

Launches an EC2 Instance.

Inputs

* AMI ID
* Instance Type
* Public Subnet ID
* Security Group ID

The EC2 instance is launched inside the public subnet and attached to the Security Group.

---

# Variable Flow

The project passes values using Terraform variables and outputs.

```
terraform.tfvars
        │
        ▼
Root variables.tf
        │
        ▼
Root main.tf
        │
        ▼
Module variables.tf
        │
        ▼
Terraform Resources
```

---
