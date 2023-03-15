variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = " VPC CIDR Block"
  type = string
}

variable "public_net_az1_cidr" {
  default = "10.0.0.0/24"
  description = "Public Net AZ1"
  type = string
}

variable "public_net_az2_cidr" {
  default = "10.0.1.0/24"
  description = "Public Net AZ2"
  type = string
}

variable "private_app_net_az1_cidr" {
  default = "10.0.2.0/24"
  description = "Private APP Net AZ1"
  type = string
}


variable "private_app_net_az2_cidr" {
  default = "10.0.3.0/24"
  description = "Private APP Net AZ2"
  type = string
}

variable "private_db_net_az1_cidr" {
  default = "10.0.4.0/24"
  description = "Private DB Net AZ2"
  type = string
}

variable "private_db_net_az2_cidr" {
  default = "10.0.5.0/24"
  description = "Private DB Net AZ2"
  type = string
}