variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "subnet_id"           { type = string }
variable "vm_name"             { type = string }
variable "vm_size"             { 
    type = string
    default = "Standard_B1s" 
    }
variable "tags"                { type = map(string) }
