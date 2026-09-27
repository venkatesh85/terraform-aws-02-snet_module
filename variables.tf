variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC to create."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "azs" {
  description = "A list of availability zones for the subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "full_private_subnet_cidrs" {
  description = "A list of CIDR blocks for the full private subnets."
  type        = list(string)
}

