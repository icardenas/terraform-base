variable "subscription_id" { type = string }
variable "project_name" {
  type    = string
  default = "terraform-demo"
}
variable "environment"     { type = string }
variable "location" {
  type    = string
  default = "East US"
}
variable "vm_size"         { type = string }
variable "vnet_address_space" { type = list(string) }
