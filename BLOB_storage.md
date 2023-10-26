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

