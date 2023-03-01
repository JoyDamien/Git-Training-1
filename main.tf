terraform {
required_providers {
azurerm = {
source = "hashicorp/azurerm"
version = "3.45.0"
}
}
}

terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "4.56.0"
}
}
}

provider "azurerm" {
# Configuration options
}

provider "aws" {
# configuration options
}

resource "azurerm_resource_group" "azure_ex_1" {
name = "azure_ex_1" # name of the resource group
location = "East US"
tags = {
env = "prod"
costcenter = "corp"
}
}

resource "aws_vpc" "aws_ex_1" {
cidr_block = "10.0.0.0/16"
intance_tenancy = "default"
tags = {
Name = "aws_ex_1"
}
}

