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
/*
variable "privateip" {
    description = "Contains the static private ip"
    type = string
}
*/

################ Manage VM variables #####################
variable "startaction" {
    description = "Contains the command decision whether to start a given vm"
    type = bool
    }

variable "stopaction" {
    description = "Contains the decision whether stop the selected vm"
    type = bool
    }

variable "adddisk" {
    description = "Contains the decision whether to add a new data disk"
    type = bool
    }

variable "existingdiskcount" {
    description = "Contains the number of existing data disks in the VM"
    type = number
    }

variable "disksize" {
    description = "size of data disk to be added"
    type = number
    }

variable "diskcount" {
    description = "number of managed data disks to add"
    type = number
    }

variable "chgsize" {
    description = "contains the decision whether to change a vm size"
    type = bool
    }

variable "diskprefix" {
    description = "Contains the disk name prefix"
    type = string
    }

variable "vmsize" {
    description = "contains the new size of vm"
    type = string
    }

variable "vmname" {
   description = "Contains the name of the VM where the managed actions are to be performed"
    type = string
    }