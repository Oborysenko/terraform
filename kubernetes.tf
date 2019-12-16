locals {
  cluster_name                 = "geniusee.local"
  master_autoscaling_group_ids = ["${aws_autoscaling_group.master-us-east-1a-masters-geniusee-local.id}", "${aws_autoscaling_group.master-us-east-1b-masters-geniusee-local.id}", "${aws_autoscaling_group.master-us-east-1c-masters-geniusee-local.id}"]
  master_security_group_ids    = ["${aws_security_group.masters-geniusee-local.id}"]
  masters_role_arn             = "${aws_iam_role.masters-geniusee-local.arn}"
  masters_role_name            = "${aws_iam_role.masters-geniusee-local.name}"
  node_autoscaling_group_ids   = ["${aws_autoscaling_group.nodes-geniusee-local.id}"]
  node_security_group_ids      = ["${aws_security_group.nodes-geniusee-local.id}"]
  node_subnet_ids              = ["subnet-0b7addb15bddffbf6", "subnet-0bf09ae5bd28f8587", "subnet-0f8a9151eab8a79fa"]
  nodes_role_arn               = "${aws_iam_role.nodes-geniusee-local.arn}"
  nodes_role_name              = "${aws_iam_role.nodes-geniusee-local.name}"
  region                       = "us-east-1"
  subnet_ids                   = ["subnet-04a4fe9bc92314834", "subnet-065d74ee3e9423a6d", "subnet-08243cd9b8ae816e1", "subnet-0b7addb15bddffbf6", "subnet-0bf09ae5bd28f8587", "subnet-0f8a9151eab8a79fa"]
  subnet_us-east-1a_id         = "subnet-0bf09ae5bd28f8587"
  subnet_us-east-1b_id         = "subnet-0b7addb15bddffbf6"
  subnet_us-east-1c_id         = "subnet-0f8a9151eab8a79fa"
  subnet_utility-us-east-1a_id = "subnet-065d74ee3e9423a6d"
  subnet_utility-us-east-1b_id = "subnet-08243cd9b8ae816e1"
  subnet_utility-us-east-1c_id = "subnet-04a4fe9bc92314834"
  vpc_id                       = "vpc-02db6b8cd1dd7bd00"
}

output "cluster_name" {
  value = "geniusee.local"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-east-1a-masters-geniusee-local.id}", "${aws_autoscaling_group.master-us-east-1b-masters-geniusee-local.id}", "${aws_autoscaling_group.master-us-east-1c-masters-geniusee-local.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-geniusee-local.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-geniusee-local.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-geniusee-local.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-geniusee-local.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-geniusee-local.id}"]
}

output "node_subnet_ids" {
  value = ["subnet-0b7addb15bddffbf6", "subnet-0bf09ae5bd28f8587", "subnet-0f8a9151eab8a79fa"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-geniusee-local.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-geniusee-local.name}"
}

output "region" {
  value = "us-east-1"
}

output "subnet_ids" {
  value = ["subnet-04a4fe9bc92314834", "subnet-065d74ee3e9423a6d", "subnet-08243cd9b8ae816e1", "subnet-0b7addb15bddffbf6", "subnet-0bf09ae5bd28f8587", "subnet-0f8a9151eab8a79fa"]
}

output "subnet_us-east-1a_id" {
  value = "subnet-0bf09ae5bd28f8587"
}

output "subnet_us-east-1b_id" {
  value = "subnet-0b7addb15bddffbf6"
}

output "subnet_us-east-1c_id" {
  value = "subnet-0f8a9151eab8a79fa"
}

output "subnet_utility-us-east-1a_id" {
  value = "subnet-065d74ee3e9423a6d"
}

output "subnet_utility-us-east-1b_id" {
  value = "subnet-08243cd9b8ae816e1"
}

output "subnet_utility-us-east-1c_id" {
  value = "subnet-04a4fe9bc92314834"
}

output "vpc_id" {
  value = "vpc-02db6b8cd1dd7bd00"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_attachment" "master-us-east-1a-masters-geniusee-local" {
  elb                    = "${aws_elb.api-geniusee-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1a-masters-geniusee-local.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1b-masters-geniusee-local" {
  elb                    = "${aws_elb.api-geniusee-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1b-masters-geniusee-local.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1c-masters-geniusee-local" {
  elb                    = "${aws_elb.api-geniusee-local.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1c-masters-geniusee-local.id}"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-geniusee-local" {
  name                 = "master-us-east-1a.masters.geniusee.local"
  launch_configuration = "${aws_launch_configuration.master-us-east-1a-masters-geniusee-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0bf09ae5bd28f8587"]

  tag {
    key                 = "KubernetesCluster"
    value               = "geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "master-us-east-1a.masters.geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag {
    key                 = "kops.k8s.io/instancegroup"
    value               = "master-us-east-1a"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-east-1b-masters-geniusee-local" {
  name                 = "master-us-east-1b.masters.geniusee.local"
  launch_configuration = "${aws_launch_configuration.master-us-east-1b-masters-geniusee-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0b7addb15bddffbf6"]

  tag {
    key                 = "KubernetesCluster"
    value               = "geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "master-us-east-1b.masters.geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag {
    key                 = "kops.k8s.io/instancegroup"
    value               = "master-us-east-1b"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-east-1c-masters-geniusee-local" {
  name                 = "master-us-east-1c.masters.geniusee.local"
  launch_configuration = "${aws_launch_configuration.master-us-east-1c-masters-geniusee-local.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0f8a9151eab8a79fa"]

  tag {
    key                 = "KubernetesCluster"
    value               = "geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "master-us-east-1c.masters.geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag {
    key                 = "kops.k8s.io/instancegroup"
    value               = "master-us-east-1c"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-geniusee-local" {
  name                 = "nodes.geniusee.local"
  launch_configuration = "${aws_launch_configuration.nodes-geniusee-local.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["subnet-0bf09ae5bd28f8587", "subnet-0b7addb15bddffbf6", "subnet-0f8a9151eab8a79fa"]

  tag {
    key                 = "KubernetesCluster"
    value               = "geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "nodes.geniusee.local"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  tag {
    key                 = "kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-geniusee-local" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "a.etcd-events.geniusee.local"
    "k8s.io/etcd/events"                   = "a/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-geniusee-local" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "a.etcd-main.geniusee.local"
    "k8s.io/etcd/main"                     = "a/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-geniusee-local" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "b.etcd-events.geniusee.local"
    "k8s.io/etcd/events"                   = "b/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-geniusee-local" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "b.etcd-main.geniusee.local"
    "k8s.io/etcd/main"                     = "b/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-geniusee-local" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "c.etcd-events.geniusee.local"
    "k8s.io/etcd/events"                   = "c/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-geniusee-local" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "c.etcd-main.geniusee.local"
    "k8s.io/etcd/main"                     = "c/a,b,c"
    "k8s.io/role/master"                   = "1"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_elb" "api-geniusee-local" {
  name = "api-geniusee-local-1o51g9"

  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-geniusee-local.id}", "sg-07b12a239380b85f7"]
  subnets         = ["subnet-04a4fe9bc92314834", "subnet-065d74ee3e9423a6d", "subnet-08243cd9b8ae816e1"]

  health_check {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  cross_zone_load_balancing = false
  idle_timeout              = 300

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "api.geniusee.local"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-geniusee-local" {
  name = "masters.geniusee.local"
  role = "${aws_iam_role.masters-geniusee-local.name}"
}

resource "aws_iam_instance_profile" "nodes-geniusee-local" {
  name = "nodes.geniusee.local"
  role = "${aws_iam_role.nodes-geniusee-local.name}"
}

resource "aws_iam_role" "masters-geniusee-local" {
  name               = "masters.geniusee.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.geniusee.local_policy")}"
}

resource "aws_iam_role" "nodes-geniusee-local" {
  name               = "nodes.geniusee.local"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.geniusee.local_policy")}"
}

resource "aws_iam_role_policy" "masters-geniusee-local" {
  name   = "masters.geniusee.local"
  role   = "${aws_iam_role.masters-geniusee-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.geniusee.local_policy")}"
}

resource "aws_iam_role_policy" "nodes-geniusee-local" {
  name   = "nodes.geniusee.local"
  role   = "${aws_iam_role.nodes-geniusee-local.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.geniusee.local_policy")}"
}

resource "aws_key_pair" "geniusee1" {
  key_name   = "geniusee1"
  public_key = "${file("${path.module}/../geniusee.pub")}"
}

resource "aws_launch_configuration" "master-us-east-1a-masters-geniusee-local" {
  name_prefix                 = "master-us-east-1a.masters.geniusee.local-"
  image_id                    = "ami-00df8fdd204d6985d"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.geniusee1.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-geniusee-local.id}"
  security_groups             = ["${aws_security_group.masters-geniusee-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1a.masters.geniusee.local_user_data")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-east-1b-masters-geniusee-local" {
  name_prefix                 = "master-us-east-1b.masters.geniusee.local-"
  image_id                    = "ami-00df8fdd204d6985d"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.geniusee1.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-geniusee-local.id}"
  security_groups             = ["${aws_security_group.masters-geniusee-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1b.masters.geniusee.local_user_data")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-east-1c-masters-geniusee-local" {
  name_prefix                 = "master-us-east-1c.masters.geniusee.local-"
  image_id                    = "ami-00df8fdd204d6985d"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.geniusee1.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-geniusee-local.id}"
  security_groups             = ["${aws_security_group.masters-geniusee-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1c.masters.geniusee.local_user_data")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-geniusee-local" {
  name_prefix                 = "nodes.geniusee.local-"
  image_id                    = "ami-00df8fdd204d6985d"
  instance_type               = "t2.small"
  key_name                    = "${aws_key_pair.geniusee1.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-geniusee-local.id}"
  security_groups             = ["${aws_security_group.nodes-geniusee-local.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.geniusee.local_user_data")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_route53_record" "api-geniusee-local" {
  name = "api.geniusee.local"
  type = "A"

  alias {
    name                   = "${aws_elb.api-geniusee-local.dns_name}"
    zone_id                = "${aws_elb.api-geniusee-local.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z3OEIASIYSU3DB"
}

resource "aws_security_group" "api-elb-geniusee-local" {
  name        = "api-elb.geniusee.local"
  vpc_id      = "vpc-02db6b8cd1dd7bd00"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "api-elb.geniusee.local"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_security_group" "masters-geniusee-local" {
  name        = "masters.geniusee.local"
  vpc_id      = "vpc-02db6b8cd1dd7bd00"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "masters.geniusee.local"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_security_group" "nodes-geniusee-local" {
  name        = "nodes.geniusee.local"
  vpc_id      = "vpc-02db6b8cd1dd7bd00"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                      = "geniusee.local"
    Name                                   = "nodes.geniusee.local"
    "kubernetes.io/cluster/geniusee.local" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.masters-geniusee-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.masters-geniusee-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-geniusee-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.api-elb-geniusee-local.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-geniusee-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-geniusee-local.id}"
  source_security_group_id = "${aws_security_group.nodes-geniusee-local.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

terraform {
  required_version = ">= 0.9.3"
}
