WHAT this manifest does:

1. Creates multiple vms in a single subnet with a single nic
2. Checks for RG , VNET , Subnet and NSG presence , if not found creates them and then creates vms . Otherwise creates vms in the already present resources
3. For same type of server( same Client , Same environment , same app tier , same app) , the same state file is to be used to increase or decrease vm counts
4. For anything different this manifest will run from a different folder
5. This can be expanded to include multiple subnets , multiple nsgs and multiple vnics . It is inscope and can be included later if required.
6. This script is meant for all sorts of vm provisioning. 


HOW to run:
1. This script should be run from within a shell or equivalent script
2. For each Client , Environment , Apptier and Application name the shell script will create relevant folder structure and clone the repo containing the manifest to that folder.
3. Based on customer arguments are to be passed to the terraform apply command using -var flag from command line.
4. The subnet, nsg and vnet resources are deleted from the terraform state after first run if created .
5. The shell will again interface with state to calculate the number of vm instances running to accordingly set the instance count.
4. Management of VMs is done through a different stateless mainfest . 