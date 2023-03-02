terraform {
required_providers {
azurerm = {
source = "hashicorp/azurerm"
version = "3.45.0"
}
aws = {
source = "hashicorp/aws"
version = "4.56.0"
}
}
required_version = "~>1.3,9"
}

provider "azurerm" {
# Configuration options
features {

}
}

provider "aws" {
# Configuration options
region = “us-east-1"
}

resource "azurerm_resource_group" "azure_rgs_terraform" {
for_each = toset(var.az-users)
name = "az-user-${each.value}"
location = "US East"
tags = {
department = "Prod"
}
}

variable "az-users" {
description = "The list of users using Azure"
default = ["Alice", "Bob", "Celine"]
}

resource "aws_s3_bucket" "aws_buckets_terraform" {
count = var.no_of_buckets
bucket = "${var.prefix_name_bucket}-${count.index}"
}

variable "no_of_buckets" {
description = "number of buckets to be created"
default = 3
}

variable "prefix_name_bucket" {
description = "the prefix of the names of buckets to be created"
default = "my-tf-test-bucket"
}
