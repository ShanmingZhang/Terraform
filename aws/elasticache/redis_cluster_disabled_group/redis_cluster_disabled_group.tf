resource "aws_elasticache_replication_group" "iac_redis_cluster_disabled_group" {
  automatic_failover_enabled    = true
  availability_zones            = ["us-east-1a", "us-east-1b", "us-east-1c"]
  replication_group_id          = "iac-redis-cluster-disabled-replica-group"
  replication_group_description = "redis cluster disabled mode"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 3
  parameter_group_name          = "default.redis5.0"
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.iac_redis_cluster_disabled_subnet_group.id
}
