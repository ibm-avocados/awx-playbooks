# Install Cloud Pak for Applications

## Prereqs

For installing CP4Apps 4.2.1

- OpenShift 4.4.4 or higher

## Setup

These variables need to passed in to the playbook.

Include in vars.yaml:

- entitled_registry_key - the key for the entitled registry (https://myibm.ibm.com/products-services/containerlibrary)
- ibmcloud_api_key - IBM Cloud API key
- cluster_id - The cluster ID of the cluster that you would like to target
- transformation_advisor_file: The file to use to configure Transformation Advisor. Either '""' or 'transadv.yaml'
- code_ready_workspaces: Would you like to install CodeReady Workspaces? Either true or false
- TA_shared_env: Would you like a shared Transformation Advisor Environment? This disables authentication on the Transformation Advisor endpoint. Either true or false.

This was tested locally with the following command:

```bash
ansible-playbook main.yml -v
```
