## AZ-900

### Azure Virtual Desktop
    - Virtual desktop for use
    - Vnet peering for connection two vnets 
    - Azure DNS -> resolves internal Vnet ips, does not work outside azure(http://somesite.local)
    - Azure VPN connects workstation to a network or network to a network , traffic in encripted. can be used intenally, 
    - If Azure VPN needs to be used out side azure then it needs a physical device which needs to be connected to the network.
    - Point to side VPN (connect your workstation to the office network)
    - Site to site VPN (connect one network to another network ), also called as VPN peering 
    - Express route -> This is faster VPN , usually this is private internet connection to the network, does not uses the public internet.
    - public endpoints

## Serverless



### Networking services
    - Vnet
    - Subnets

### Storage services

### Database services


### Powershell
```powershell 
# list all modules
Get-Module -ListAvailable
Get-Module -ListAvailable -Name Az

# Install Azure Powershell
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# Update Azure Powershell
Update-Module -Name Az

# Connect to Azure
Connect-AzAccount
```


### Containers
    - Web app for Containers
    - container instances
        - Used for bursts for k8's
        - Non production workloads , testing 
    - Container registry (Needed to enable admin account to use the image in web app and container instances)


#### Resource groups
* Resource group should have a region 
* 
* On delete all the resources inside the resource group are deleted
* 

Bandwidth cost :
* Data moving outside azure cost money
* 
* Data moving inside azure is free.
* 

Networking
Virtual Network:
* Isolated network 
* 
* Ip range needs to be specified 
* 
* At least one subnet must be created
* 
* Resources in the same subnet can communicate via private IP address
* 
* Connect two vnets using vent peering 
* 

Network security groups: 
* Nsg filters the traffic depending on the inbound and outbound rule.
* 
* High priority rules takes the lead , any overlapping rule after that is ignored.   
* 
* Multiple inbound and outbound rule can be specified.
* 
* Nsg’s are connected to subnet or network interfaces nic’s.
* 
* Nsg can’t be linked to the vent , instead azure file wall service is used to filter traffic to the virtual network.
* 

Application security group:
* is extension of nsg’s
* 
* Servers can be grouped under multiple applications security groups and then those application security groups can then be defined in the nsgs , hence you don’t have to create rules for all the servers in the group.
* 
Azure VPN:
* Point to site :Traffic travels through vpn to virtual network gateway and then towards the vent
* 
* Site to site : Traffic travels through on premises network or any other network to virtual network gateway and then the the vent 
* 
Express route:
* Dedicated private connection from on prem network or any network to the azure network. 
* 

Azure load balancer: 
* Balance traffic between multiple servers.
* 
* Public lb gets the traffic from Internet 
* 
* Private lb gets the traffics from within the network 
* 
* Add servers in back end pool setting in load balancer.
* 
* Health probe can be added to Lb to check if backend machines are healthy . Define the probe and then define the rule 
* 
* You don’t need to have public ip linked to the servers and the lb has the public ip attached to it 
* 

Azure DNS( Domain name service ) :

* DNS can be purchased from external domain provider
* 
* DNS records needs to be configured in the azure DNS 
* 
* Create DNS zone , give the name as the domain you purchased from some external service. 
* 
* The DNS zone then needs to be connected to the domain service 
