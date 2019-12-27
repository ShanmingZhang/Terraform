resource "aws_elasticache_cluster" "instance_replica_cluster" {
  cluster_id           = "cluster-example"
  replication_group_id = aws_elasticache_replication_group.iac_redis_cluster_disabled.id
}
