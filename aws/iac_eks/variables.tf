variable "iac-var-template" {
  description = ""
  type        = string
  default     = ""
}


# ---
variable "iac-vpc-name" {
  description = "Specify the name of vpc"
  type        = string
  default     = "iac-eks-vpc"
}

variable "iac-vpc-cidr-block" {
  description = "Specify the cidr block of vpc"
  type        = string
  default     = "192.168.0.0/16"
}

variable "iac-cidr-block-of-subnets" {
  description = "Specify the cidr blocks for vpc, the amount of cidr blocks is the same as the amount of disered subnets"
  type        = list(string)
  default     = ["192.168.64.0/18", "192.168.128.0/18", "192.168.192.0/18"]
}

variable "iac-subnet-available-zones" {
  description = "Specify the available zones for subnets of vpc"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "iac-subnet-names" {
  description = "Specify the names for subnets of vpc"
  type        = list(string)
  default     = ["eks-vpc-Subnet01", "eks-vpc-Subnet02", "eks-vpc-Subnet03"]
}

# ---

# ---
variable "iac-redis-cluster-id" {
  description = "Specify the id of redis cluster"
  type        = string
  default     = "iac-redis-eks"
}

# the zones must belong to the specified vpc
#
variable "iac-redis-cluster-zones" {
  description = "Specify the availablle zones for redis cluster"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "iac-redis-version" {
  description = "Specify version of redis"
  type        = string
  default     = "default.redis5.0"
}

variable "iac-redis-cluster-node-type" {
  description = "Specify node instance type of redis cluster nodes"
  type        = string
  default     = "cache.t2.micro"
}

variable "iac-redis-subnet-group-name" {
  description = "Specify the name of redis cluster subnet group"
  type        = string
  default     = "iac-redis-cluster-subnets"
}

# ---



# ---
variable "iac-session-manager-role-name" {
  description = "Specify the session manager role name"
  type        = string
  default     = "iac-session-manager-role"
}

variable "iac-eks-role-name" {
  description = "Specify the eks role name"
  type        = string
  default     = "iac-eks-role"
}
# ---


# ---
variable "iac-ecr-repository-name-list" {
  description = "Define repository names, the size of list must be the same as the specified amount"
  type        = list(string)
  default     = ["iac-ocr-rep-nginx", "iac-ocr-rep-flask", "iac-ocr-rep-ocr", "iac-ocr-rep-fluentd"]
}
# ---

# ---
variable "iac-s3-bucket-name" {
  description = "Define a s3 bucket name list "
  type        = list(string)
  default     = ["iac-aws-setting", "iac-docker-images", "iac-k8s"]
}
# ---



