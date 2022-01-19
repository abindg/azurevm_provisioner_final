client = "sun"
environment = "prd"
resourcegroupname = "myrsg"
resourcegrouplocation = "eastus"
vnetname = "vnet"
vnetaddress = ["10.9.0.0/16"]
subnetname = "myweb"
subnetaddress = ["10.9.1.0/24"]
nsg = "web-nsg"
nsgports = [22, 80, 443]
vmcount = 2
hostname = "apache-vm"  
size = "Standard_B2s"
user = "adminuser"
password = "root@123" 
pubipname = "apache-pub" 
vnicname = "apache-lin-nic" 
pubipreqd = true


