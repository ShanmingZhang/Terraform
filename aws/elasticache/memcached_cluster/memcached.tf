
resource "aws_elasticache_cluster" "iac_memcached_cluster" {
  cluster_id           = "iac-memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.5"
  port                 = 11211

  subnet_group_name = aws_elasticache_subnet_group.iac_memcached_subnet_group.id
}

