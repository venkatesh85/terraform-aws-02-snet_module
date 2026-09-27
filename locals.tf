locals {
  public_subnet_cidrs = distinct(var.public_subnet_cidrs)
  private_subnet_cidrs = distinct(var.private_subnet_cidrs)
  private_full_subnet_cidrs = distinct(var.full_private_subnet_cidrs)
  azs = distinct(var.azs)
}