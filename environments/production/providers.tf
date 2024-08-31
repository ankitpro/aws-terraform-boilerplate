terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    organization = "Video-Platform-Devops"
    workspaces {
      name = "aws-dev"
    }
  }
}

provider "aws" {
  region = var.region
}
