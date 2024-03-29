# Azure - Research & Infrastructure setup

## What is Azure?

- A cloud computing plaform and service offered by Microsoft.
- Provides IaaS, PaaS and SaaS.
- Provides scalability, reliability and flexibility.
- Users only pay for the services they use.

### Market share

- As of 2023, Azure is the second-largest Cloud provider.
- The market share of Azure is 26%.
- Azures share has been steadily rising.

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

### Azure Resource Structure - How are Resources organised

1) Management Groups - Can have up to 6 levels (Scope - Policies and Permissions) - Used to manage large numbers of subscriptions.
2) Subscriptions - (Scope - Policies and Permissions).
3) Resource Groups - (Scope - Policies and Permissions).
4) Resources - All resources (VNets, VMs, SSH keys) need to be allocated to a Resource Group.

## Differences between Azure and AWS

#### Availability Zones

- AWS - Availability Zones in a region not limited to 3
- Azure - Availability Zones - Maximum of 3

#### Security Groups


#### Storage

- AWS uses Buckets
- Azure uses containers

#### Networking



## Setting up Infrastructure on Azure

### Virtual Network Diagram

![Alt text](<images/26. diagram v3.jpg>)

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

1) In the search bar at the top, type in Virtual Network (or select the Virtual Network icon if its there).
![Alt text](<images/4. virtual network.jpg>)
2) Click on "Create".
![Alt text](<images/6. create vnet.jpg>)
3) Under "Basics":
- Choose the `tech254` Resource group.
- Give the Virtual network a name, e.g. `tech254-alex-app-db-vnet`
- Make sure the Region is `UK South`.
![Alt text](<images/7. naming and resource.jpg>)
4) Under "Security":
- Don't enable any of the tickboxes for Bastion, Firewall and Network protection.
- These all have extremely high monthly subscription costs so never select them for training purposes.
5) Under IP addresses:
- Change the Vnet Address space to `10.0.0.0/16`
![Alt text](<images/8. cidr and subnets.jpg>)
- Alter the default subnet to be called `public-subnet` with the CIDR block 10.0.2.0/24.
![Alt text](<images/9. editing subnets.jpg>)
- Add another subnet to be called `private subnet` with the CIDR block 10.0.3.0/24.
6) In the "Tags" tab, add an Owner tag with your name associated.
![Alt text](<images/10. tags.jpg>)
7) Click `Review + Create`.
![Alt text](<images/11. review and create.jpg>)
8) Make sure all the settings are as they should be and click `Create`.
![Alt text](<images/12. review page.jpg>)

### Virtual Machines

1) In the search bar at the top, type in Virtual Machine (or select the Virtual Machine icon if its there).
![Alt text](<images/5. virtual machine.jpg>)
2) Click on "Create" then "Azure Virtual Machine".
![Alt text](<images/14. create azure vm.jpg>)
3) On the "Basics" tab, add the following:
- Resource Group - `tech254`
- Name the VM, e.g. `tech254-alex-test-vm`
- Choose `UK South` as the region
- For "Secuity Type" choose `Standard`
- For "Image" choose `Ubuntu Pro 18.04 lts` (see blockers section if this won't work)
- For "Size" choose `Standard B1s`
- Change username to `adminuser` from azureuser so it's more unique and less hackable
- Choose your Azure Public Key already stored on the Azure console
- Choose the appropriate Inbound Port rules depending on instance type (SSH definitely required)
![Alt text](<images/15. basics part 1.jpg>)
![Alt text](<images/16. basics part 2.jpg>)
4) On the "Disks" tab:
- Change "OS Disk Type" from Premium SSD to `Standard SSD`
![Alt text](<images/17. disks.jpg>)
5) On the "Networking" tab:
- Choose the Virtual Network you made earlier e.g. `tech254-alex-app-db-vnet`
- Choose the subnet you need (public for app, private for db)
- Choose the Public IP if its the app VM
- Edit additional inbound security rules with "Advanced" if required
- Select the tickbox `Delete public IP and NIC when VM is deleted` to avoid needing to manually delete this when terminating a VM
![Alt text](<images/18. networking.jpg>)
6) On the "Advanced" tab:
- Scroll down to User data and tick the box
- Insert your bash script for making either the app or db VM
![Alt text](<images/19. user data.jpg>)
7) Add the tags.
![Alt text](<images/10. tags.jpg>)
8) Check over the review page to make sure everything is correct then click on `Create`.
![Alt text](<images/20. create.jpg>)

### SSH Connection to Instances

To connect to your Virtual Machine:

1) Go to the overview page of the VM you want to Connect to.
2) Click the "Connect" button.
![Alt text](<images/21. ssh connect.jpg>)
3) Choose "Native SSH" from the two options on screen.
![Alt text](<images/22. native ssh.jpg>)
4) On the right hand pane that comes up, go to Point 3 and add the path to your Azure Private key on your computer system.
5) Copy the command that gets populated into GitBash from Home.
![Alt text](<images/23. key connect.jpg>)

### Updating Security Rules

1) Go to the overview page for the VM you want to alter the rules of.
2) On the left hand pane in the VM window, under "settings", click on the "Networking" tab.
3) The inbound security rules should be visible here.
4) For "Priority", the lower the number means the higher the priority (e.g. 300 is higher priority than 400).
5) Higher priority rules trump lower priority rules even if they allow for the opposite rule.
6) Clicking on an existing rule can allow you to change the settings.
7) Click on "Add inbound port rule" to add a new rule (just make sure you give it the correct priority).

### Deleting a Public IP address from the DB VM

1) Go to the overview page for the VM you want to delete the Public IP address for.
2) Click on the public IP address on the overview page.
![Alt text](<images/27. IP address.jpg>)
3) This takes you to the configuration page for that IP address.
4) On the left hand pane of that IP address, click overview.
![Alt text](<images/28. overview.jpg>)
5) Click on "Dissociate".
![Alt text](<images/29. dissociate.jpg>)
6) Click on "Delete".
![Alt text](<images/30. delete.jpg>)

## Installing Azure CLI

- Go to the following website for instructions on how to install Azure CLI
````
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
````

1) Connect to your Virtual Machine with SSH.
2) In the GitBash terminal, run the following command:
````
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
````
3) Run the Azure login command below:
````
az login
````
4) The AZ login command will bring up yellow text with a URL and a login code.
5) Copy and paste the URL into a web browser.
6) Input the login code when prompted.
7) Choose your microsoft account associated with the resource group.
8) The webpage will show the below message:
![Alt text](<images/31. AZ CLI.jpg>)
9) When you return to GitBash you will see all the login details like ID and email address to show the login was successful.

### Resolving blockers

#### 1) Ubuntu Pro 18.04 lts image not populating on VM creation page

There's a bug which stops the Ubuntu Pro 18.04 lts image from populating when you try and make a VM. To resolve this:
1) Go to the "Resources" page from the Azure Console.
2) Make sure you're on the `tech254` resources page.
3) Click the `Create` button.
4) Search for the Ubuntu Pro 18.04 lts image.
5) Select that image and you immediately get taken to the VM creation page with the image and resource group pre-filled.

#### 2) `sudo apt upgrade -y` command requiring user input in User Data

User data for updating and upgrading the OS doesn't work on the same script used for AWS. User input is required on the upgrade area. To bypass this, run the following command:
````
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
````
OR
````
sudo apt update
````
````
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
````

#### 3) App repo location with User Data

- Using User Data to clone the App repo will by default do all this in the root directory.
- When you connect to your instance, you connect as "adminuser".
- Use the following command to get to your root directory:
````
cd /
````
- In this directory you can now navigate to the app folder

#### 4) Killing PM2

- PM2 runs in the root directory using User Data.
- First navigate to the root directory.
- Do `pm2 list` to list all pm2 processes (although this will show no processes)
````
pm2 list
````
- The app is already running on Port 3000 and only one process can run there so attempting to run the app again will fail.
- Find out the Process ID (PID) of the process you want to kill.
- To check the Node processes running:
````
ps aux | grep node
````
- Because PM2 is still running, killing a node process will instantly run another one so you need to kill the PM2 process instead.
- To check the PM2 processes running:
````
ps aux | grep pm2
````
- To kill a process, do the following command
````
sudo kill <PID number>
````
- Check the IP address to see if the app is still running.
