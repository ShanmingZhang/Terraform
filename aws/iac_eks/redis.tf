# after configuring the security group and vpc and others
resource "aws_elasticache_replication_group" "iac-redis-cluster" {
  automatic_failover_enabled    = true
  availability_zones            = var.iac-redis-cluster-zones
  replication_group_id          = var.iac-redis-cluster-id
  replication_group_description = "redis cluster"
  node_type                     = var.iac-redis-cluster-node-type
  number_cache_clusters         = 3
  parameter_group_name          = var.iac-redis-version
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.iac-redis-subnet-group.id
}
