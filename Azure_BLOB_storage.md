# BLOB Storage on Azure

## What is BLOB storage on Azure?

- Azure Blob Storage is Microsoft Azure's object storage service. 
- It is designed to store and manage unstructured data, such as documents, images, videos, and other binary data.
- The unstructured data is stored in containers.

## How it works on Azure

### Access Tiers

- Hot tier - An online tier optimized for storing data that is accessed or modified frequently. The hot tier has the highest storage costs, but the lowest access costs.
- Cool tier - An online tier optimized for storing data that is infrequently accessed or modified. Data in the cool tier should be stored for a minimum of 30 days. The cool tier has lower storage costs and higher access costs compared to the hot tier.
- Cold tier - An online tier optimized for storing data that is infrequently accessed or modified. Data in the cold tier should be stored for a minimum of 90 days. The cold tier has lower storage costs and higher access costs compared to the cool tier.
- Archive tier - An offline tier optimized for storing data that is rarely accessed, and that has flexible latency requirements, on the order of hours. Data in the archive tier should be stored for a minimum of 180 days

### Data Redundency

- Locally redundant storage (LRS) - copies your data synchronously three times within a single physical location in the primary region. LRS is the least expensive replication option, but isn't recommended for applications requiring high availability or durability.
- Zone-redundant storage (ZRS) - copies your data synchronously across three Azure availability zones in the primary region.

## Creating BLOB storage on Azure

### Useful websites

- Installing Azure CLI
````
https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
````
- Creating BLOB Storage
````
https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-cli
````
- Changing container permissions
````
https://learn.microsoft.com/en-us/cli/azure/storage/container?view=azure-cli-latest#az-storage-container-set-permission
````

### Making and Uploading

Log into the Azure CLI on GitBash.

1) Create storage account.
````
az storage account create --name tech254alexstorage --resource-group tech254 --location uksouth --sku Standard_ZRS
````
2) Create container.
````
az storage container create --name testcontainer --account-name tech254alexstorage --auth-mode login
````
3) Uploading to container.
````
az storage blob upload --account-name tech254alexstorage --container-name testcontainer --name newtest.txt --file test.txt --auth-mode login
````
4) Changing container permissions.
````
az storage container set-permission --name <container_name> --public-access blob --account-name <storage_account_name> --auth-mode login
````

### Downloading files from the internet

1) Downloading and renaming a picture
````
curl -o <rename_pic.jpg> <picture_URL.jpg>
````

### Editing index.ejs

1) Command for adding image URL.
````
sed -i 's|</h2>|<img src="image_URL.jpg">|' views/index.ejs
````

