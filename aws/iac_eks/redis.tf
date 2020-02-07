# after configuring the security group and vpc and others
resource "aws_elasticache_replication_group" "iac_redis_cluster" {
  automatic_failover_enabled    = true
  availability_zones            = var.iac-redis-cluster-zones
  replication_group_id          = var.iac-redis-cluster-id
  replication_group_description = "redis cluster"
  node_type                     = var.iac-redis-cluster-node-type
  number_cache_clusters         = 3
  parameter_group_name          = var.iac-redis-version
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.iac_redis_subnet_group.id

  security_group_ids = [aws_security_group.iac_sg_redis.id]
}

resource "aws_elasticache_subnet_group" "iac_redis_subnet_group" {
  name       = var.iac-redis-subnet-group-name
  subnet_ids = [aws_subnet.iac_eks_vpc_subnet_01.id, aws_subnet.iac_eks_vpc_subnet_02.id, aws_subnet.iac_eks_vpc_subnet_03.id]
}

