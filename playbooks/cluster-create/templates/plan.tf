# Configure the IBM Cloud Provider
provider "ibm" {
  ibmcloud_api_key    = "{{ ibmcloud_api_key }}"
}

data "ibm_space" "spacedata" {
  space = "dev"   # this will be different if you aren't is this space
  org   = "Developer Advocacy" # this will be different if you aren't is this org
}

data "ibm_org" "org" {
  org = "${data.ibm_space.spacedata.org}"
}

data "ibm_space" "space" {
  org   = "${data.ibm_space.spacedata.org}"
  space = "${data.ibm_space.spacedata.space}"
}

data "ibm_account" "account" {
  org_guid = "${data.ibm_org.org.id}"
}

resource "ibm_container_cluster" "jj-testing-cluster" {
  count           = 1
  name            = "jj-testing-cluster-${count.index}"
  datacenter      = "dal13"
  machine_type    = "b3c.4x16"
  hardware        = "shared"
  public_vlan_id  = "2873680"
  private_vlan_id = "2749184"
  kube_version    = "1.17.11"
  tags            = ["jj-testing","terraform"]
  default_pool_size      = 1
}


