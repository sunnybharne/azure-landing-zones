# Administrator
Link: https://learn.microsoft.com/en-us/training/career-paths/administrator

## Describe cloud concepts
### Describe cloud computing

- Delivery of computing services over the internet.

- **Shared Responsibility Model**.

| |**On-Premise**|**IaaS**|**PaaS**|**SaaS**|
|-|-|-|-|-|
| **Responsibilities** | Customer is responsible for everything. | Microsoft: Physical infrastructure<br>Customer: OS, apps, data, maintenance, security patches | Microsoft: Physical infrastructure, OS, patching<br>Customer: App, data | Microsoft: Application, OS, patching, infrastructure<br>Customer: Data |
| **Examples** | on prem server | Azure Virtual Machines | Azure SQL, Azure App Service | Office 365, Dynamics 365 |
| **Best Use Cases** | Full control with complete responsibility. | - Best candidate for lift-and-shift migration<br>- Testing and development environments where you need to quickly spin up/down resources | - Best for spinning up environments without the headache of managing underlying infrastructure and patching | - Use when you need ready-to-use apps with minimal management |

- **cloud models**

| **Public Cloud**                        | **Private Cloud**                                          | **Hybrid Cloud**                                 | **Multi-Cloud**                                 |
|------------------------------------------|-------------------------------------------------------------|--------------------------------------------------|--------------------------------------------------|
| Azure or any public cloud                | On-prem cloud hosted in the customer’s data center          | Public + Private cloud          | Use of multiple public clouds (e.g., Azure + AWS + GCP) |

- **Consumption based model**
    - **capex**: Capital expenditure, upfront cost, buying the servers. 
    - **opex**: Operational expenditure, pay as you go, renting the servers. ie. cloud computing.

> [!Note]
> - Azure arc helps you manager the resources in public , private, hybrid cloud and on prem. Its like a superman managing all the resources you own.
> - You can keep using your vmware solution with azure, Azure has seemless integration with vmware

### Describe the benefits of cloud computing

- **High availabality**: Uptime (availability) , uptime is garanteed by SLA depending on the service.
    | **Availability (%)** | **Downtime per Month**    |
    |----------------------|---------------------------|
    | 99.0%                | 7.2 hours                 |
    | 99.9%                | 43.2 minutes              |
    | 99.99%               | 4.32 minutes              |
    | 99.999%              | 25.9 seconds              |
    | 99.9999%             | 2.59 seconds              |
- **Scalability**: (ability to scale on demand), adding or removing resources as needed.
    - **Vertical scaling**: Adding more power to existing resources (CPU, RAM)
    - **Horizontal scaling**: Adding more resources (VMs, servers) to the pool. This is used when there is sudden spike in traffic.(also called as scaling out and scaling in) 
- **Elasticity**: Ability to automatically scale resources up or down based on demand. This is done by using **autoscaling**.
- **Reliability**: Recover from failures, often by automatically switching to another region. Some services handle failover without any manual action.
- **Predictability**: Plan with confidence by making performance and costs more consistent.
    - **Performance**: Autoscaling, load balancing, and high availability ensure your app runs smoothly, even during traffic spikes.
    - **Cost**: You can monitor and forecast cloud spending using tools like TCO and the Pricing Calculator, helping you stay within budget.
- **Governance**: Use templates to enforce standards, update resources as rules change, and flag non-compliant ones automatically.
- **Security**: Choose the right service model based on control, needs—IaaS for full control, or PaaS/SaaS for automatic updates and patches. Also protect against threats like DDoS attacks.
- **Manageability**: There are two manageability options available in Azure.
    - **Management of the cloud**: Deployment and manupulation of the resources in azure cloud.
    - **Management in cloud**: How you can manage your resources in the cloud. This is done by using Azure Portal, Azure CLI, Azure PowerShell, Azure SDKs, Azure REST APIs.

### Describe Cloud services types

|        | **Infrastructure as a Service (IaaS)**                                                                                                                                      | **Platform as a Service (PaaS)**                                                                                                                                                   | **Software as a Service (SaaS)**                                                                                                                     |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it is**               | Rent hardware (servers, storage, etc.) and manage everything else—OS, networking, and apps.                                                                                 | Build and run apps without managing servers or OS. The platform handles the underlying setup.                                                                                      | Ready-to-use software delivered over the internet—no setup needed.                                                                                  |
| **Who manages what**         | **You** manage most things (OS, apps, networking).<br>**Provider** handles physical hardware and internet access.                                                          | **Provider** manages hardware, OS, databases, and tools.<br>**You** focus on your app and data.                                                                                     | **Provider** handles everything except your **data, users, and devices**.                                                                            |
| **Use Cases**                | - Lift-and-shift of on-prem apps<br>- Custom dev/test environments with full control                                                                                        | - Building web or mobile apps<br>- Rapid development without managing infrastructure                                                                                               | - Email and messaging<br>- Office and productivity apps<br>- Finance and expense tracking                                                            |

## Describe Azure architecture and services

### Describe the core architectural components of Azure

- Core architectural components
   - Physical infrastructure  
     - datacenters (Server racks with power, cooling, and networking)
     - regions (1+ datacenters, networked together with low-latency, Workload is intelligently balanced within these regions)
     - availability zones (physically separate datacenters within a region with independent power, cooling, and networking)
       - Minimum 3 separate az's are present in all az-enabled regions. not all Regions support az's.
         - Zonal services: Pin the resource to a specific zone (for example, VMs, managed disks, IP addresses).
         - Zone-redundant services: The platform replicates automatically across zones (for example, zone-redundant storage, SQL Database).
         - Non-regional services: Global services (for example, Azure Active Directory, Azure Traffic Manager).
     - Region pairs
        - Most Azure regions are paired with another region within the same geography for automatic failover.Most regions are paired in two directions but in some cases it might not be true.
     - Sovereign Regions (regions—isolated instances used by governments)
   - Management infrastructure  
     - Resource Groups: Logical grouping of resources
     - Subscription: boundaries(Billing boundary, Access control boundary)
     - Management Groups: Hierarchical grouping of subscriptions for governance

### Describe Azure compute and networking services

- Azure virtual machines(Iaas)
    - VM Resources
        - Images(preconfigured OS and software)
        - Size (purpose, number of processor cores, and amount of RAM),
        - Storage disks (hard disk drives, solid state drives, etc.)
        - Networking (virtual network, public IP address, and port configuration)
    - Scale VMs in Azure
        - VMSS
            - Identical, load-balanced VMs that can automatically scale.
        - Availbaility sets (VMSS with additional qualities, No additional cost) 
            - Update domain: Grouping that reboot at the same time, 30 mins to recover before next update domian starts.
            - Fault domain: Grouping by common power source and network switch. By default, an availability set splits your VMs across up to three fault domains.

- Azure virtual desktop
    - Centralized security management for users' desktops using Microsoft Entra ID.
    - MFA
    - RBACs for data access.
    - App data is separate from the local hardware.
    - Multi-session Windows 10 or Windows 11 deployment

- Azure containers
    - Azure Container Instances (most quickest)
    - Azure Container Apps (additionally with load balancing and scaling)
    - Azure Kubernetes Service

- Azure functions
    - Stateless (default), Restarted every time, no state maintained.
    - Stateful (Durable Functions), context is passed to track prior activity.

- Azure App Service
    - Web apps,WebJobs, API apps, mobile apps/ back ends.(NET, .NET Core, Java, Ruby, Node.js, PHP, Python --> Windows/Linux) 
        - All of these app styles are hosted in the same infrastructure

- Azure virtual networking
    - Isolation and segmentation
        - You can use the name resolution service built into Azure. use either internal or external DNS server. 
    - Internet communication
        - Enable incoming connections from the internet by assigning a public IP address to an Azure resource, or putting the resource behind a public load balancer.
    - Communicate between Azure resources
        - **Service endpoints** can connect two different Azure resource types, such as Azure SQL databases and storage accounts.
    - Communicate with on-premises resources
        - Point-to-site vpn are from a computer outside your organization back into your corporate network.Here the client computer initiates an encrypted VPN connection to connect to the Azure virtual network.
        - Site-to-site vpn link your on-premises VPN device or gateway to the Azure VPN gateway in a virtual network.The connection is encrypted and works over the internet.
        - Azure ExpressRoute is site-to-site vpn with dedicated connection and does not traverse over the internet.
    - Route network traffic
        - By default, Azure routes traffic between subnets on any connected virtual networks and the internet.
            - Custom route tables control how packets are routed between subnets.
            - Border Gateway Protocol (BGP) works with Azure VPN gateways, Azure Route Server, or Azure ExpressRoute to propagate on-premises BGP routes to Azure virtual networks.
    - Filter network traffic
        - NSG can contain multiple inbound and outbound security rules.
        - Network virtual appliances are specialized VMs that can be compared to a hardened network appliance. A NVA carries out a particular network function, such as running a firewall or performing wide area network (WAN) optimization.
    - vnet peering - Link virtual networks together by using . 
    - User-defined routes (UDR) allow you to control the routing tables between subnets within a virtual network or between virtual networks. This allows for greater control over network traffic flow.   
    - Azure virtual private networks
        - VPN uses an encrypted tunnel within another network. Connect two or more trusted private networks to one another over an untrusted network. Traffic is encrypted while traveling over the untrusted network to prevent eavesdropping or other attacks. VPNs can enable networks to safely and securely share sensitive information.
        - VPN gateways
            - A VPN gateway is a type of virtual network gateway. Azure VPN Gateway instances are deployed in a dedicated subnet of the virtual network and enable the following connectivity:
                - Connect on-premises datacenters to virtual networks through a site-to-site connection.
                - Connect individual devices to virtual networks through a point-to-site connection.
                - Connect virtual networks to other virtual networks through a network-to-network connection.
            - All data transfer is encrypted inside a private tunnel as it crosses the internet. You can deploy only one VPN gateway in each virtual network. However, you can use one gateway to connect to multiple locations, which includes other virtual networks or on-premises datacenters.
        - When setting up a VPN gateway, you must specify the type of VPN - either policy-based or route-based. The primary distinction between these two types is how they determine which traffic needs encryption. In Azure, regardless of the VPN type, the method of authentication employed is a preshared key.
            - Policy-based VPN gateways specify statically the IP address of packets that should be encrypted through each tunnel. This type of device evaluates every data packet against those sets of IP addresses to choose the tunnel where that packet is going to be sent through.
            - In Route-based gateways, IPSec tunnels are modeled as a network interface or virtual tunnel interface. IP routing (either static routes or dynamic routing protocols) decides which one of these tunnel interfaces to use when sending each packet. Route-based VPNs are the preferred connection method for on-premises devices. They're more resilient to topology changes such as the creation of new subnets.
            - Use a route-based VPN gateway if you need any of the following types of connectivity:
                - Connections between virtual networks
                - Point-to-site connections
                - Multisite connections
                - Coexistence with an Azure ExpressRoute gateway
        - High-availability of the vpn 
             - By default, VPN gateways are deployed as two instances in an active/standby configuration, even if you only see one VPN gateway resource in Azure. When planned maintenance or unplanned disruption affects the active instance, the standby instance automatically assumes responsibility for connections without any user intervention. Connections are interrupted during this failover, but they typically restore within a few seconds for planned maintenance and within 90 seconds for unplanned disruptions.
    Active/active
            - With the introduction of support for the BGP routing protocol, you can also deploy VPN gateways in an active/active configuration. In this configuration, you assign a unique public IP address to each instance. You then create separate tunnels from the on-premises device to each IP address. You can extend the high availability by deploying an additional VPN device on-premises.
    ExpressRoute failover
            - Another high-availability option is to configure a VPN gateway as a secure failover path for ExpressRoute connections. ExpressRoute circuits have resiliency built in. However, they aren't immune to physical problems that affect the cables delivering connectivity or outages that affect the complete ExpressRoute location. In high-availability scenarios, where there's risk associated with an outage of an ExpressRoute circuit, you can also provision a VPN gateway that uses the internet as an alternative method of connectivity. In this way, you can ensure there's always a connection to the virtual networks.
    Zone-redundant gateways
            - In regions that support availability zones, VPN gateways and ExpressRoute gateways can be deployed in a zone-redundant configuration. This configuration brings resiliency, scalability, and higher availability to virtual network gateways. Deploying gateways in Azure availability zones physically and logically separates gateways within a region while protecting your on-premises network connectivity to Azure from zone-level failures. These gateways require different gateway stock keeping units (SKUs) and use Standard public IP addresses instead of Basic public IP addresses.
- Azure ExpressRoute
    - lets you extend your on-premises networks into the azure over a private connection, with the help of a connectivity provider. This connection is called an ExpressRoute Circuit. With ExpressRoute, you can establish connections to Microsoft cloud services, such as Microsoft Azure and Microsoft 365. This feature allows you to connect offices, datacenters, or other facilities to the Microsoft cloud. Each location would have its own ExpressRoute circuit.
    - Connectivity can be from an any-to-any (IP VPN) network, a point-to-point Ethernet network, or a virtual cross-connection through a connectivity provider at a colocation facility. ExpressRoute connections don't go over the public Internet. This setup allows ExpressRoute connections to offer more reliability, faster speeds, consistent latencies, and higher security than typical connections over the Internet   .
Features and benefits of ExpressRoute
    - There are several benefits to using ExpressRoute as the connection service between Azure and on-premises networks.
        - Connectivity to Microsoft cloud services across all regions in the geopolitical region.
        - Global connectivity to Microsoft services across all regions with the ExpressRoute Global Reach.
        - Dynamic routing between your network and Microsoft via Border Gateway Protocol (BGP).
        - Built-in redundancy in every peering location for higher reliability.
    - Connectivity to Microsoft cloud services
        - ExpressRoute enables direct access to the following services in all regions:
            - Microsoft Office 365
            - Microsoft Dynamics 365
            - Azure compute services, such as Azure Virtual Machines
            - Azure cloud services, such as Azure Cosmos DB and Azure Storage

    - Global connectivity
        - You can enable ExpressRoute Global Reach to exchange data across your on-premises sites by connecting your ExpressRoute circuits. For example, say you had an office in Asia and a datacenter in Europe, both with ExpressRoute circuits connecting them to the Microsoft network. You could use ExpressRoute Global Reach to connect those two facilities, allowing them to communicate without transferring data over the public internet.
    - Dynamic routing
        - ExpressRoute uses the BGP. BGP is used to exchange routes between on-premises networks and resources running in Azure. This protocol enables dynamic routing between your on-premises network and services running in the Microsoft cloud.
    - Built-in redundancy
        Each connectivity provider uses redundant devices to ensure that connections established with Microsoft are highly available. You can configure multiple circuits to complement this feature.
        - ExpressRoute connectivity models
        - ExpressRoute supports four models that you can use to connect your on-premises network to the Microsoft cloud:
            - CloudExchange colocation
            - Point-to-point Ethernet connection
            - Any-to-any connection
            - Directly from ExpressRoute sites
     - Colocation at a cloud exchange
        - Colocation refers to your datacenter, office, or other facility being physically colocated at a cloud exchange, such as an ISP. If your facility is colocated at a cloud exchange, you can request a virtual cross-connect to the Microsoft cloud.
            - Point-to-point ethernet connection refers to using a point-to-point connection to connect your facility to the Microsoft cloud.
            Any-to-any networks
            - With any-to-any connectivity, you can integrate your wide area network (WAN) with Azure by providing connections to your offices and datacenters. Azure integrates with your WAN connection to provide a connection like you would have between your datacenter and any branch offices.
             - Directly from ExpressRoute sites
             You can connect directly into the Microsoft's global network at a peering location strategically distributed across the world. ExpressRoute Direct provides dual 100 Gbps or 10-Gbps connectivity, which supports Active/Active connectivity at scale.
    - Security considerations
        - With ExpressRoute, your data doesn't travel over the public internet, reducing the risks associated with internet communications. ExpressRoute is a private connection from your on-premises infrastructure to your Azure infrastructure. Even if you have an ExpressRoute connection, DNS queries, certificate revocation list checking, and Azure Content Delivery Network requests are still sent over the public internet.
- Azure DNS
    - Azure DNS is a hosting service for DNS domains that provides name resolution by using Microsoft Azure infrastructure. By hosting your domains in Azure, you can manage your DNS records using the same credentials, APIs, tools, and billing as your other Azure services.
    - Benefits of Azure DNS
        - Azure DNS uses the scope and scale of Microsoft Azure to provide numerous benefits, including:
            - Reliability and performance
            - Security
            - Ease of Use
            - Customizable virtual networks
            - Alias records
    - Reliability and performance
        - DNS domains in Azure DNS are hosted on Azure's global network of DNS name servers, providing resiliency and high availability. Azure DNS uses anycast networking, so the closest available DNS server answers each DNS query, providing fast performance and high availability for your domain.
        Security
    - Azure DNS is based on Azure Resource Manager, which provides features such as:
        Azure role-based access control (Azure RBAC) to control who has access to specific actions for your organization.
        Activity logs to monitor how a user in your organization modified a resource or to find an error when troubleshooting.
        Resource locking to lock a subscription, resource group, or resource. Locking prevents other users in your organization from accidentally deleting or modifying critical resources.
    - Ease of use
        - Azure DNS can manage DNS records for your Azure services and provide DNS for your external resources as well. Azure DNS is integrated in the Azure portal and uses the same credentials, support contract, and billing as your other Azure services.
        - Because Azure DNS is running on Azure, it means you can manage your domains and records with the Azure portal, Azure PowerShell cmdlets, and the cross-platform Azure CLI. Applications that require automated DNS management can integrate with the service by using the REST API and SDKs.
Customizable virtual networks with private domains
        - Azure DNS also supports private DNS domains. This feature allows you to use your own custom domain names in your private virtual networks, rather than being stuck with the Azure-provided names.
Alias records
        - Azure DNS also supports alias record sets. You can use an alias record set to refer to an Azure resource, such as an Azure public IP address, an Azure Traffic Manager profile, or an Azure Content Delivery Network (CDN) endpoint. If the IP address of the underlying resource changes, the alias record set seamlessly updates itself during DNS resolution. The alias record set points to the service instance, and the service instance is associated with an IP address.

> Important
> -You can't use Azure DNS to buy a domain name. For an annual fee, you can buy a domain name by using App Service domains or a third-party domain name registrar. Once purchased, your domains can be hosted in Azure DNS for record management.

### Describe Azure storage services

- Azure Storage account(unique namespace)
- Storage account types
    - Standard general-purpose v2 (LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS)
    - Premium block blobs (LRS, ZRS)
    - Premium file shares (LRS, ZRS)
    - Premium page blobs (LRS)

- Redundancy Options:
    - Locally redundant storage (LRS , 3 copies in 1 of dc in primary region with 11 9's durability )
    - Zone-redundant storage (ZRS, 3 copies in 3 dc in primary region 1 each with 12 9's durability)
    - Geo-redundant storage (GRS , like LRS in both the regions, with 16 9's durability)
    - Geo-zone-redundant storage (GZRS .ZRA in ZRA in primary region and LRS in the secondary region ,with 16 9's durability)
    - Read-access geo-redundant storage (RA-GRS)
    - Read-access geo-zone-redundant storage (RA-GZRS)

> [!Note]
> - Remember that the data in your secondary region may not be up-to-date due to RPO(recovery point objective). Defference between asynchronous points which is usually 15 minutes.

- Storage types
    - Azure Blobs: Store text and binary data. Also includes support for big data analytics through Data Lake Storage Gen2. (https://<storage-account-name>.blob.core.windows.net, https://<storage-account-name>.dfs.core.windows.net)
        - Access tiers
            - Hot access: Accessed frequently (Can be set at account and blob level)
            - Cool access: Stored for at least 30 days. (Can be set at account and blob level, slightly lower availability)
            - Cold access: Stored for at least 90 days. (Can be set at account and blob level , slightly lower availability)
            - Archive access: Stored for at least 180 days. (cant be set at the account level similar to others , stores data offline and have more retrival costs)
    - Azure Files: Cloud drive (https://<storage-account-name>.file.core.windows.net)
        - Accessed from SMB(all os's) or NFS protocols(mac and linux).
        - Can be cached on windows servers over SMB protocols.
    - Azure Queues: Like AWS SQS (https://<storage-account-name>.queue.core.windows.net)
        - Each individual message can be up to 64 KB in size
    - Azure Disks: VM disks
    - Azure Tables: NoSQL table.(https://<storage-account-name>.table.core.windows.net) 
        - Ideal for storing structured, non-relational data.

- Identify Azure data migration options
    - Supports both real-time migration of infrastructure, applications, and data using Azure Migrate as well as asynchronous migration of data using Azure Data Box.
    - Azure Migrate -> Azure Migrate hub, you can assess and migrate your on-premises infrastructure to Azure.
       - Real time migration from on prem to cloud
       - Unified migration platform: A single portal to start, run, and track your migration to Azure.
       - Discovery and assessment tool -> Discover and assess on-premises servers in preparation for migration to Azure.
       - Server Migration tool -> Migrate on prem or other cloud servers to Azure.
       - Data Migration Assistant -> Stand-alone tool to assess SQL Servers. It helps pinpoint potential problems blocking migration. It identifies unsupported features, new features that can benefit you after migration, and the right path for database migration.
       - Azure Database Migration Service -> Migrate on-premises databases to Azure VMs running SQL Server, Azure SQL Database, or SQL Managed Instances.
       - Azure App Service migration assistant -> Standalone tool to assess on-premises websites for migration to Azure App Service. Use Migration Assistant to migrate .NET and PHP web apps to Azure.
       - Azure Data Box -> Move large amounts of offline data to Azure physically (80 terabytes, data can be moved to and from azure).

- Identify Azure file movement options
     - AzCopy -> Command-line utility to copy/upload/download  blobs/files to or from your storage account/ other cloud services. (one-direction synchronization)
     - Azure Storage Explorer -> Graphical interface (uses azcopy on the backend)
     - Azure File Sync -> Automatically bi-directionally synced with your files in Azure on windows server.(SMB, NFS, and FTPS protocol) , Have as many caches as you need across the world.

### Describe Azure IAM and security

- Azure directory services
    - Microsoft Entra
        - Authentication: self-service password reset, MFA, a custom list of banned passwords, and smart lockout services.
        - Single sign-on: SSO
        - Application management: Application Proxy, SaaS apps, the My Apps portal, and single sign-on provide a better user experience.
        - Device management: Microsoft Intune. It allows device-based Conditional Access policies to restrict access attempts to only those coming from known devices.
    - MS Entra Connect -> Synchronizes user identities between on-premises AD and Entra ID 
    - MS Entra Domain Services  
       - Managed domain services such as domain join, group policy, lightweight directory access protocol (LDAP), and Kerberos/NTLM authentication. 
       - Lets you run legacy applications in the cloud that can't use modern authentication methods. 
       - Without needing to manage the AD DS environment in the cloud.
       - Integrates with your existing MS Entra tenant.(Use existing credentials) 
       - Define a unique namespace. This namespace is the domain name. Two Windows Server domain controllers are then deployed into your selected Azure region. This deployment of DCs is known as a replica set.
       - DC includes backups and encryption at rest using Azure Disk Encryption.
       - A managed domain is configured to perform a one-way synchronization from Microsoft Entra ID to Microsoft Entra Domain Services. You can create resources directly in the managed domain, but they aren't synchronized back to Microsoft Entra ID. In a hybrid environment with an on-premises AD DS environment, Microsoft Entra Connect synchronizes identity information with Microsoft Entra ID, which is then synchronized to the managed domain.
       - Applications, services, and VMs in Azure that connect to the managed domain can then use common Microsoft Entra Domain Services features such as domain join, group policy, LDAP, and Kerberos/NTLM authentication.

- Azure authentication methods
   - Standard passwords,
   - SSO : Sign in one time and use that credential to access multiple resources and applications from different providers.
   - MFA
   - Passwordless.
        - Windows Hello for Business ( Windows pc with pin or fingerprint)
        - Microsoft Authenticator app ( Phone authenticator app , authentication app can be used in passwordless mode)
        - FIDO2 security keys ( This uses external security key or a platform key built into a device)
   - Azure external identities
        - Business to business (B2B) collaboration - Collaborate with external users by letting them use their preferred identity, typically a guest user.
        - B2B direct connect - Establish a mutual, two-way trust with another Microsoft Entra organization for seamless collaboration.Supports Teams shared channels,B2B direct connect users aren't represented in your directory, but they're visible from within the Teams shared channel and can be monitored in Teams admin center reports.
        - Microsoft Azure Active Directory business to customer (B2C) - Publish modern SaaS apps or custom-developed apps (excluding Microsoft apps) to consumers and customers, while using Azure AD B2C for identity and access management.
   - Azure conditional access (For example, a user might not be challenged for second authentication factor if they're at a known location)
        - Allow (or deny) access to resources based on identity signals. Including who the user is, where the user is, and what device the user is requesting access from.
        - During sign-in, Conditional Access collects signals from the user, makes decisions based on those signals, and then enforces that decision by allowing or denying the access request or challenging for a multifactor authentication response.
   - Azure role-based access control
   - Zero Trust model
        - Security model that assumes the worst case scenario 
            - Verify explicitly - Always authenticate and authorize based on all available data points.
            - Use least privilege access - Limit user access with Just-In-Time and Just-Enough-Access (JIT/JEA) 
            - Assume breach - Minimize blast radius and segment access. Verify end-to-end encryption. Use analytics to get visibility, drive threat detection, and improve defenses.
   - Defense-in-depth
        - You can visualize defense-in-depth as a set of layers, with the data to be secured at the center and all the other layers functioning to protect that central data layer.
        - Layers
            - Physical security layer : First line of defense to protect computing hardware in the datacenter.
            - Identity and access layer : Controls access to infrastructure and change control.
            - Network Perimeter layer : Uses distributed denial of service (DDoS) protection to filter large-scale attacks before they can cause a denial of service for users.
            - Network layer : limits communication between resources through segmentation and access controls.
            - compute layer : Secures access to virtual machines.
            - Application layer : Helps ensure that applications are secure and free of security vulnerabilities.
            - Data layer: Controls access to business and customer data that you need to protect.
   - MS Defender for Cloud
        - Monitoring tool for security posture management and threat protection. It monitors your cloud, on-premises, hybrid, and multicloud environments to provide guidance and notifications aimed at strengthening your security posture.
        - Defender for Cloud is an Azure-native service, many Azure services are monitored and protected without needing any deployment.
        - However, if you also have an on-premises datacenter or are also operating in another cloud environment, monitoring of Azure services may not give you a complete picture of your security situation.
        - When necessary, Defender for Cloud can automatically deploy a Log Analytics agent to gather security-related data. For Azure machines, deployment is handled directly. For hybrid and multicloud environments, Microsoft Defender plans are extended to non-Azure machines with the help of Azure Arc. Cloud security posture management (CSPM) features are extended to multicloud machines without the need for any agents.
   - Azure-native protections
        - Azure PaaS services – Detect threats targeting Azure services including Azure App Service, Azure SQL, Azure Storage Account, and more data services. You can also perform anomaly detection on your Azure activity logs using the native integration with Microsoft Defender for Cloud Apps (formerly known as Microsoft Cloud App Security).
        - Azure data services – Defender for Cloud includes capabilities that help you automatically classify your data in Azure SQL. You can also get assessments for potential vulnerabilities across Azure SQL and Storage services, and recommendations for how to mitigate them.
        - Networks – Defender for Cloud helps you limit exposure to brute force attacks. By reducing access to virtual machine ports, using the just-in-time VM access, you can harden your network by preventing unnecessary access. You can set secure access policies on selected ports, for only authorized users, allowed source IP address ranges or IP addresses, and for a limited amount of time.
        - Defend your hybrid resources
             - In addition to defending your Azure environment, you can add Defender for Cloud capabilities to your hybrid cloud environment to protect your non-Azure servers. To help you focus on what matters the most, you'll get customized threat intelligence and prioritized alerts according to your specific environment.
        - To extend protection to on-premises machines, deploy Azure Arc and enable Defender for Cloud's enhanced security features.
        - Defend resources running on other clouds
             - Defender for Cloud can also protect resources in other clouds (such as AWS and GCP).
             - Defender for Cloud's CSPM features extend to your AWS resources. This agentless plan assesses your AWS resources according to AWS-specific security recommendations, and includes the results in the secure score. The resources will also be assessed for compliance with built-in standards specific to AWS (AWS CIS, AWS PCI DSS, and AWS Foundational Security Best Practices). Defender for Cloud's asset inventory page is a multicloud enabled feature helping you manage your AWS resources alongside your Azure resources.
             - Microsoft Defender for Containers extends its container threat detection and advanced defenses to your Amazon EKS Linux clusters.
             - Microsoft Defender for Servers brings threat detection and advanced defenses to your Windows and Linux EC2 instances.
        - Assess, Secure, and Defend
             - Defender for Cloud fills three vital needs as you manage the security of your resources and workloads in the cloud and on-premises:
                  - Continuously assess – Know your security posture. Identify and track vulnerabilities.
                  - Secure – Harden resources and services with Azure Security Benchmark.
                  - Defend – Detect and resolve threats to resources, workloads, and services.

## Describe Azure management and governance

### Cost management

- OpEx cost impacted by:
    - Resource type (ie: storage account type, VM configuration)
    - Consumption (Reserved instances, pay-as-you-go)
    - Maintenance (ie: vm creation will created extra resources but dicommisioning will not remove those extra resources)
    - Geography (moving information from to and from regions is expensive) 
        - Network traffic (Bandwidth, data transfer pricing based on zones, ie : 
            - Inbound data transfers (data going into Azure datacenters) are free.
            - Outbound data transfers (data leaving Azure datacenters) are charged based on zones.
        )
    - Subscription type
    - Azure Marketplace
- Pricing Calculator (TCO Calculator: retired , calculated report can be exported or saved for later use )
- Azure cost  management tool (Check organisational level costs, budgets, and forecasts)
    - Cost alert:
        - Budget alerts (Cost based and usage based alert), user need to create a budget and then create an alert on top of that budget
        - Credit alerts
        - Departmental spending quota alerts
- Tags
    - AppName
    - CostCenter
    - Owner
    - Environment
    - Impact (business criticality)

### Features and tools in azure for governance and compliance
- MS Purview( used to identify risks and monitor your data)
    - Data discovery
    - Sensitive data classification
    - End to end data lineage
    - Protect sensitive data across clouds, apps, and devices.
    - Identify data risks and manage regulatory compliance requirements.
    - Get started with regulatory compliance.
- Azure policy
    - Azure policies gets applied to all the child resources
    - Policy initiative ( group of azure policies )
- Resource locks
    - resource locks can be inherited.
         - Delete lock (Resource modification is possible, but deletion is not allowed)
         - Read-only lock (no deletion or modification is allowed)
- MS service trust portal
    - Provides access to tools like Microsoft security, privacy, and compliance practices.
    - Contains information about Microsoft's implementation of controls and processes that protect our cloud services and the customer data.
    - Service trust portal can save reports and documents also it have have notifications on those.(available for download atleast for 12 months)

### Features and tools for managing and deploying resources
- Interacting with azure
    - Azure portal
    - Azure Cloud Shell
        - Azure CLI
        - Azure PowerShell
- Azure arc
    - Arc lets you take your compliance and monitoring to your hybrid and multi cloud configurations.
    - You can manage your non azure resources using arc
    - Below resources outside are supported currently 
        - Servers
        - Kubernetes clusters
        - Azure data services
        - SQL Server
        - Virtual machines (preview)
- Arm and Arm templates
    - Management layer which creates , updates and deletes the resources
    - Any request to the azure resources goes through the arm layer no matter which interface you use.
    - You can use bicep to write iac as it is idempotent you can deploy the same file multiple times without worrying about the state of the resources.

### Monitoring tools in azure
- Azure advisor
    - Evaluates your resources and makes recommendations to help improve reliability, security, and performance, achieve operational excellence, and reduce costs. 
    - You can set up notifications to alert you to new recommendations.
    - On the Advisors dashboard, you get personalized recommendations for all your subscriptions (you can use filters to filter subscription or resource groups or services)
    - Recomendation catagpries
        - Reliability
        - Security
        - Performance
        - Operational excellence
        - Cost
- Azure service health
   - Helps you keep track of Azure resource, both your specifically deployed resources and the overall status of Azure.
        - Azure Status 
          - Broad picture of the status of Azure globally.
          - Informs you of service outages in Azure on the Azure Status page. 
          - Page is a global view of the health of all Azure services across all Azure regions.
        - Service Health provides a narrower view of Azure services and regions.
          - Set up Service Health alerts to notify you when service issues, planned maintenance, or other changes may affect the Azure services and regions you use.
          - In the event that a workload you’re running is impacted by an event, Azure Service Health provides links to support.
        - Resource Health
          - Health view of your actual Azure resources.
- Azure monitor
   - Is a platform for collecting data on your resource,analyzing that data, visualizing the information, and even acting on the results.
   - Works even on onprem and multi could resources like vm's
   - Log analytics 
      - This is where you write and run queries on the data gathered from azure monitor.
      - You can use filters to sort and manupulate the logs according to your needs.
   - Azure monitor alers
      - This is self explanatory
      - This uses an action group to configure who to notify and what action to take.
      - Action group is just a collection of notification preferences and actions that you can use to notify users or trigger actions when an alert is fired.
    - Application insights
      - This is an azure monitor feature which monitors your web applications
      - Capable of monitoring applications running on on prem or on different could environments.
      - To use this you have to either use an SDK or an application insite agent(This is only supported on c# and .net)

## Organize azure

### Resource groups 
- Overview (Used for logical grouping of resources)
    - Essentials
        - Subscription: (You can also move the rg to a different subscription), subscription link takes you to the subscription overview page.
        - SubscriptionID: Just a sub ID string
        - Tags: Add or remove tags for the rg (az resource tag <Key=Value> --resource-group <rg-name> --name <rg-name>)
        - Deployments: Link to the deployment section
        - Location: Location of the resource group (Not the actual resource location
### Policies to enforce standards
- Policy Defination
- Policy Assignment(With the enforced mode)
### RBAC
- Follow least privilage principle to assign roles to users|
### Resource locks
- Set resource locks to either Delete or Read-only.
- Read-only can lead to unexpected results, because some operations that seem like read operations actually require additional actions. For example, placing a Read-only lock on a storage account prevents all users from listing the keys. The list keys operation is handled through a POST request because the returned keys are available for write operations.
### Cloud Shell
- Cloud shell provides access to storage to persist files such as SSH keys scripts and more, This lets you access them from any devices and with different sessions.
