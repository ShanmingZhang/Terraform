
resource "aws_elasticache_cluster" "iac_redis_instance" {
  cluster_id           = "iac-redis-instance"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  # only one node
  num_cache_nodes      = 1  
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.0"
  port                 = 6379
 
  subnet_group_name    = aws_elasticache_subnet_group.iac_redis_instance_subnet_group.id
}
