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

variable "ssh_location" {
  default = "0.0.0.0/0"
  description = "SSH login to Jumphost"
  type = string
}

variable "database_snapshot_identifier" {
  default = "arn:aws:rds:ap-southeast-1:181147970314:snapshot:web01-rds-bak"
  description = "SB Snapshot ARN"
  type = string
}

variable "database_instance_class" {
  default = "db.t2.micro"
  description = "DB instance type"
  type = string
}

variable "database_instance_identifier" {
  default = "web01-rds"
  description = "DB instance identifier"
  type = string
}

variable "multi_az_deployment" {
  default = false
  description = "Create a standby db instance"
  type = bool
}

variable "ssl_certificate_arn" {
  default = "arn:aws:acm:ap-southeast-1:181147970314:certificate/6c16fa8f-8d72-4f03-b320-db616c9b2f35"
  description = "SSL Cert asfreeze.info"
  type = string
}

variable "client_email" {
  default = "uaungswan@gmail.com"
  description = "my email"
  type = string
}

variable "launch_template_name" {
  default = "web01-launch-template"
  description = "name of launch template"
  type = string
}

variable "ec2_image_id" {
  default = "ami-001258b8337a4faed"
  description = "my ami id"
  type = string
}

variable "ec2_instance_type" {
  default = "t2.micro"
  description = "my ec2 type"
  type = string
}

variable "ec2_ssh_key" {
  default = "cfn-key-1"
  description = "my ssh key"
  type = string
}