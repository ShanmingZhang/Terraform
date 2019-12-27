resource "aws_elasticache_replication_group" "iac_redis_cluster_enabled" {
  replication_group_id          = "iac-redis-cluster-enabled"
  replication_group_description = "redis cluster enabled mode"
  node_type                     = "cache.t2.micro"
  port                          = 6379
  parameter_group_name          = "default.redis5.0.cluster.on"
  automatic_failover_enabled    = true

  cluster_mode {
    replicas_per_node_group = 2
    num_node_groups         = 2
  }
  subnet_group_name    = aws_elasticache_subnet_group.iac_redis_cluster_enabled_subnet_group.id
}

