# Azure

## What is Azure?

- A cloud computing plaform and service offered by Microsoft.
- Provides IaaS, PaaS and SaaS.
- Provides scalability, reliability and flexibility.
- Users only pay for the services they use.

### Services offered

- **Virtual Machines (VMs)** - Allows users to create and manage virtual machines in the cloud
- **Azure App Service** - Allows developers to build, host, and scale web applications and APIs
- **Azure Storage** - Offers different types of storage solutions, including blob storage for unstructured data, table storage for structured data, and Azure Files for file shares
- **Azure SQL Database** - A fully managed relational database service that allows users to create, manage, and scale SQL databases in the cloud
- **Azure Functions** - Serverless computing service that allows you to run code in response to events without the need to manage infrastructure
- **Azure Kubernetes Service (AKS)** - A managed Kubernetes container orchestration service for deploying, managing, and scaling containerized applications using Kubernetes
- **Azure Active Directory** - A cloud-based identity and access management service that enables secure authentication and authorization for applications and services
- **Azure Cosmos DB** - A globally distributed, multi-model database service that supports NoSQL data models like document, key-value, graph, and column-family
- **Azure Virtual Network** - Provides networking capabilities to connect virtual machines, on-premises data centers, and other Azure services
- **Azure DevOps** - A set of development tools and services for managing the entire application development lifecycle, including planning, development, testing, and deployment
- **Azure AI and Machine Learning** - Offers a range of services for artificial intelligence and machine learning, including Azure Machine Learning and cognitive services
- **Azure IoT (Internet of Things)** - A set of services for building and managing IoT solutions

## Azure Structure

- All Azure resources have to be associated to a Resource Group.

### Azure Resource Structure

- Management Groups - Can have up to 6 levels (Scope - Policies and Permissions) - Used to mamage large numbers of subscriptions.
- Subscriptions - (Scope - Policies and Permissions)
- Resource Groups - (Scope - Policies and Permissions)
- Resources

### Azure VM Structure

## Differences between Azure and AWS

#### Availability Zones

- AWS - Availability Zones in a region not limited to 3
- Azure - Availability Zones - Maximum of 3

## Setting up Infrastructure on Azure

### Set up SSH key connection

1) Log into the Azure portal on portal.azure.com.
2) In the resource bar at the top of the page, search "SSH Keys".
![Alt text](<images/1. main page.jpg>)
3) Click on "Create".
![Alt text](<images/2. create ssh key pair.jpg>)
4) Under "Project Details":
- Choose `tech254` as the Resource Group
- Give the key a descriptive name (e.g. `tech254-alex-azure-key`)
- Click upload existing key to use one you've added to your .ssh folder.
- Upload the PUBLIC key by doing the `cat key_name.pub` command in your SSH folder and pasting the key into the Upload key box
- Click Create
![Alt text](<images/3. add the key.jpg>)
5) Add the "Owner" tag and give the value as your name.

### Virtual Networks (Equivalent to VPCs on AWS)

1) In the search bar at the top, type in Virtual Network.


### Virtual Machines