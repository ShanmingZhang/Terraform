variable "iac-var-template" {
  description = ""
  type        = string
  default     = ""
}


variable "iac-config-of-subnet-01" {
  type = object({ name = string, availability_zone = string, cidr_block = string })
  default = {
    name              = "iac-eks-vpc-subnet01"
    availability_zone = "us-east-1a"
    cidr_block        = "192.168.101.0/24"
  }
}

variable "iac-config-of-subnet-02" {
  type = object({ name = string, availability_zone = string, cidr_block = string })
  default = {
    name              = "iac-eks-vpc-subnet02"
    availability_zone = "us-east-1a"
    cidr_block        = "192.168.102.0/24"
  }
}

variable "iac-config-of-subnet-03" {
  type = object({ name = string, availability_zone = string, cidr_block = string })
  default = {
    name              = "iac-eks-vpc-subnet03"
    availability_zone = "us-east-1a"
    cidr_block        = "192.168.103.0/24"
  }
}

variable "iac-config-of-subnet-04" {
  type = object({ name = string, availability_zone = string, cidr_block = string, instance_ip = string })
  default = {
    name              = "iac-eks-vpc-subnet04"
    availability_zone = "us-east-1a"
    cidr_block        = "192.168.104.0/24"
    instance_ip       = "192.168.104.104"
  }
}

