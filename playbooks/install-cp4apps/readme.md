# Install Cloud Pak for Applications

## Prereqs

For installing CP4Apps 4.2.1

- OpenShift 4.4.4 or higher

## Flow

This playbook follows the following flow.

1. Check to see if the host machine has the necessary tools installed
    1. Docker
    1. OpenShift cli
    1. IBM Cloud cli
1. Log into the IBM Cloud using the provided apikey
1. Using the kubernetes service plugin for the IBM Cloud CLI, get the cluster config for the target cluster.
1. Log into the OpenShift cluster using the OC CLI. The IBM Cloud API key is used again here to authenticate.
1. Log into the private registry where the containerized CP4Apps installer is located. This will authenticate using the entitled registry key from [this link.](https://myibm.ibm.com/products-services/containerlibrary)
1. Get config files if not already present. These config files detail what components to install with CP4Apps and will be downloaded into the `./data` directory if that directory is not already present.
1. Check to see if CP4Apps can be installed on the cluster. (Checks OpenShift version, installed operators, and more). This check is run from within a container that encapsulates the install process.
1. Run the installer. The installer is run from within a container that encapsulates the install process.

## Setup

These variables need to passed in to the playbook.

Extra vars:

- ENTITLED_REGISTRY_PASSWORD - the key for the entitled registry (https://myibm.ibm.com/products-services/containerlibrary)
- APIKEY - IBM Cloud API key
- CLUSTER - The cluster ID

This was tested locally with the following command:

```bash
ansible-playbook -c local --extra-vars "ENTITLED_REGISTRY_PASSWORD=<password> CLUSTER=<cluster> APIKEY=<apikey>" playbook.yml -v
```
