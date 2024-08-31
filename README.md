# AWS Terraform Boilerplate

Welcome to the Terraform Boilerplate repository! This project is designed to help you easily provision cloud infrastructure using Terraform. It includes modular and reusable configurations for various cloud resources, such as Auto Scaling Groups, IAM roles, Lambda functions, S3 buckets, Security Groups, SNS topics, and SSM parameters.

---

## Table of Contents

- [Terraform Boilerplate](#terraform-boilerplate)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Modules](#modules)
    - [Auto Scaling Group (ASG)](#auto-scaling-group-asg)
    - [IAM](#iam)
    - [Lambda](#lambda)
    - [S3](#s3)
    - [Security Group](#security-group)
    - [SNS](#sns)
    - [SSM](#ssm)
  - [Environments](#environments)
    - [Example Environment Structure:](#example-environment-structure)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Customizing](#customizing)
  - [Contributing](#contributing)
    - [How to Contribute](#how-to-contribute)

---

## Overview

This Terraform boilerplate provides a well-structured and modular approach to setting up cloud infrastructure. The resources are organized into separate modules, making it easy to manage and reuse configurations across different environments.

---

## Modules

### Auto Scaling Group (ASG)

The ASG module manages the creation of Auto Scaling Groups, including launch configurations, scaling policies, and associated instance management.

**Key Features:**
- Configurable launch configurations and scaling policies
- Integration with CloudWatch alarms for scaling
- Support for multiple instance types and AMIs

### IAM

The IAM module is responsible for creating and managing IAM roles, policies, and users, ensuring secure access control for your infrastructure.

**Key Features:**
- Creation of IAM roles and policies
- Attach managed policies or create inline policies
- Support for IAM users and groups

### Lambda

The Lambda module simplifies the deployment of AWS Lambda functions, including the creation of associated IAM roles, permissions, and triggers.

**Key Features:**
- Deploy Lambda functions from source code or S3
- Configure IAM roles and permissions for Lambda
- Support for event triggers (e.g., S3, SNS)

### S3

The S3 module handles the creation and management of S3 buckets, including bucket policies, versioning, and encryption settings.

**Key Features:**
- Create S3 buckets with customizable settings
- Manage bucket policies, ACLs, and versioning
- Enable server-side encryption

### Security Group

The Security Group module is used to define and manage security groups with customizable inbound and outbound rules.

**Key Features:**
- Create security groups with specified ingress and egress rules
- Support for multiple protocols and port ranges
- Attach security groups to EC2 instances, load balancers, etc.

### SNS

The SNS module manages the creation of SNS topics, subscriptions, and associated access control policies.

**Key Features:**
- Create SNS topics and configure subscriptions
- Support for various subscription protocols (e.g., email, SMS)
- Manage topic policies and permissions

### SSM

The SSM module simplifies the management of SSM parameters and documents, enabling you to store configuration data and secrets securely.

**Key Features:**
- Create and manage SSM parameters
- Support for secure string parameters
- Create SSM documents for automation tasks

---

## Environments

This boilerplate includes separate configurations for different environments such as `dev`, `staging`, and `prod`. Each environment can be customized with specific variables and settings to match your deployment needs.

### Example Environment Structure:

- **`dev/`**: Terraform configuration for the development environment.
- **`prod/`**: Terraform configuration for the production environment.

---

## Getting Started

### Prerequisites

To use this boilerplate, you'll need:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An account with your cloud provider (e.g., AWS).
- Cloud provider credentials configured on your local machine.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/terraform-boilerplate.git
   cd terraform-boilerplate

2. Navigate to the Desired Environment:
   ```bash
   cd environments/dev

3. Initialize Terraform:
   ```bash
   terraform init

### Usage

1. Customize Variables: Edit the terraform.tfvars file in your environment directory to customize your infrastructure settings.

2. Plan the Infrastructure:
   ```bash
   terraform plan

3. Apply the Configuration:
   ```bash
   terraform apply

4. Destroy the Infrastructure (if needed):
   ```bash
   terraform destroy

### Customizing

You can customize the boilerplate by modifying the modules in the modules/ directory or by adding new ones. To add a new module, create a new directory under modules/ and follow the existing structure.

---

## Contributing

We welcome contributions to this Terraform boilerplate! If you have suggestions for improvements or find a bug, please open an issue or submit a pull request.

### How to Contribute:
1. Fork the repository.
2. Create a new branch (git checkout -b feature/your-feature-name).
3. Make your changes.
4. Commit your changes (git commit -m 'Add some feature').
5. Push to the branch (git push origin feature/your-feature-name).
6. Open a pull request.

---

### Page is still under construction. Will keep updating it as and when possible. Keep watching for more updates.

---

## Feedback

If you have any feedback, please reach out to me at [ankitagarwalpro@gmail.com](mailto:ankitagarwalpro@gmail.com) 

---

## 📫 **Connect with Me**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ankitagarwal94/)
[![Reddit](https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white)](https://www.reddit.com/user/chillbaba007/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ankitagarwalpro@gmail.com)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/ankitko0l)
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ankitpro.github.io/portfolio/)

![Ankit's GitHub stats](https://github-readme-stats.vercel.app/api?username=ankitpro&show_icons=true&theme=radical&show=prs_merged,prs_merged_percentage)

---

This project is licensed under the MIT License.
