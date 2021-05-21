variable "bucket_name" {
  type    = string
  default = "2ef5ed51f7fcc8ddee9335f42b016382"
}

variable "environment" {
  type    = string
  default = "test"
}

variable "aws_region" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "aws_zone" {
  type = map

  default = {
    "us_1a"   = "us-east-1a"
    "us_1b"   = "us-east-1b"
    "us_1c"   = "us-east-1c"
  }
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.0.10.0/24"]
}

# variable "vpc_dns" {
#   type = "map"

#   default = {
#     "default" = "true"
#     "false"   = "false"
#   }
# }

# variable "public_subnet_cidr" {
#   description = "CIDR for the public subnet"
#   default     = "10.0.1.0/24"
# }

# variable "private_subnet_cidr" {
#   description = "CIDR for the private subnet"
#   default     = "10.0.100.0/24"
# }

# variable "ami" {
#   description = "Amazon Linux AMI"
#   default     = "ami-4fffc834"
# }

# data "template_file" "userdata_default" {
#   template = "${file("userdata_default.tpl")}"
# }

# variable "namespace" {
#   default = "b-tintuk"
# }

# variable "public_key_path" {
#   description = "Path to public key for ssh access"
#   default     = "/Users/tin/.ssh/id_rsa.pub"
# }

# variable "machine_block_size" {
#   type = "map"

#   default = {
#     "default" = 10
#   }
# }

# variable "machine_block_type" {
#   type = "map"

#   default = {
#     "default" = "standard"
#   }
# }

# variable "machine_port" {
#   description = "The port the server will use for HTTP requests"
#   type = "map"

#   default = {
#     "ssh"     = 22
#     "web"     = 8080
#     "http"    = 80
#     "https"   = 443
#   }
# }

# variable "machine_name" {
#   type = "map"

#   default = {
#     "default" = "b-bootstrap"
#   }
# }

# variable "machine_ami" {
#   type = "map"

#   default = {
#     "default" = "ami-07539a31f72d244e7"
#     "ubuntu"  = "ami-061eb2b23f9f8839c"
#     "centos"  = "ami-00c5fcec4d0bcb70f"
#   }
# }

# variable "machine_type" {
#   type = "map"

#   default = {
#     "default" = "t3a.micro"
#   }
# }

# variable "machine_count" {
#   type = "map"

#   default = {
#     "default" = 1
#   }
# }

# data "aws_availability_zones" "all" {}