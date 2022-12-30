variable "name" {
  description = "name"
  type        = string
  default     = "default"
}

variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "vpc region"
  type        = string
  default     = "ap-northeast-2"
}

variable "private_subnets" {
  description = "list of private subnet"
  type        = list(string)
}

variable "public_subnets" {
  description = "list of public subnet"
  type        = list(string)
}

variable "enable_vpn_gateway" {
  description = "enable VPN gateway (vgw)"
  type        = bool
  default     = false
}

variable "enable_ipv6" {
  description = "enable IPv6"
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "enable NAT gateway"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "enable single NAT gateway"
  type        = bool
  default     = false
}

variable "is_terraform" {
  type    = bool
  default = true
}
variable "env" {
  description = "environment"
  type        = string
  default     = "development"
}

variable "owner" {
  description = "created by"
  type        = string
  default     = "jawn"
}