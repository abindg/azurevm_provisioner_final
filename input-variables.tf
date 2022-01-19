variable "client" {
    description = "Client of TCS for which the resources are created"
    type = string  
}

variable "environment" {
    description = "the environment for which the resources are created"
    type = string
}

variable "resourcegroupname" {
    description = "Contains the resource group name"
    type = string
}

variable "resourcegrouplocation" {
    description = "Contains the resource group location" 
    type = string
}

variable "vnetname" {
    description = "Contains the vnet name suffix"
    type = string
}

variable "vnetaddress" {
    description = "Contains the vnet address range "
    type = list(string)
}

variable "subnetname" {
    description = "Contains the websubnet name suffix"
    type = string
}

variable "subnetaddress" {
    description = "Contains the websubnet address range "
    type = list(string)
}

variable "nsg" {
  description = "Contains name of nsg"
  type = string
}

variable "nsgports" {
  description = "Contains the nsg ports to be opened for a subnet"
  type = list(number)
}

variable "vmcount" {
    description = "Enter the number of vms"
    type = number
}

variable "hostname" {
    description = "Contains the hostname suffix of linux vm"
    type = string
}

variable "size" {
    description = "Contains the size of the linux vm"
    type = string  
}

variable "user" {
    description = "Contains the admin username"
    type = string  
}

variable "password" {
    description = "Contains the admin user password"
    type = string 
}

variable "pubipreqd" {
    description = "Is a pubip required eo be attached in the group of vms being created"
    type = bool
    default = true  
}

variable "pubipname" {
    description = "Contains the pubip suffix"
    type = string  
}

variable "vnicname" {
    description = "Contains the suffix of the vnic name"
    type = string  
}
