environment   = "test"
cluster_name  = "nclouds"
region        = "us-west-2"

### VPC MODULE
vpc = {
    cidr          = "10.2.0.0/16",
    dns_hostnames = true,
    dns_support   = true,
    tenancy       = "default"
}

public_subnets  = ["10.2.0.0/24","10.2.1.0/24","10.2.5.0/24"]
private_subnets = ["10.2.2.0/24","10.2.3.0/24","10.2.4.0/24"]

dhcp_options_domain_name="test.ua"
#dhcp_options_domain_name_servers = ["8.8.8.8", "8.8.4.4"]


### KUBERNETES MODULE
kops_state_bucket = "geniusee/kops"
worker_node_type = "t3.medium"
min_worker_nodes = "1"
max_worker_nodes = "2"
master_node_type = "t3.medium"

kops_cluster =  {
  cluster_name ="test"
  dns_zone = "test.net" # Use k8s.local for non route53 records
  kubernetes_version = "1.12.8"
  worker_node_type = "t3.medium"
  min_worker_nodes  = 1
  max_worker_nodes = 5
  master_node_type  = "t3.medium"
  region = "us-east-1"
  state_bucket = "kops-state"
  node_image = "kope.io/k8s-1.12-debian-stretch-amd64-hvm-ebs-2019-05-13"
  nodes = [
    {
      name = "nodes",
      role = "agent",
      instanceType = "t3.medium"
      minSize = 1,
      maxSize = 5,
    },
    {
      name = "bastion",
      role = "agent",
      instanceType = "t3.medium"
      minSize = 1,
      maxSize = 5,
    },
    {
      name = "elasticsearch",
      role = "agent",
      instanceType = "t3.medium"
      minSize = 1,
      maxSize = 5,
    },
    {
      name = "ivanhoe",
      role = "agent",
      instanceType = "t3.medium"
      minSize = 1,
      maxSize = 5,
    }
  ]
  # List of available addons: https://github.com/kubernetes/kops/tree/master/addons
  addons = [
    "metrics-server"
  ]
}
