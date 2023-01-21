variable "users" {
  type        = map(map(string))
  description = "The list of User"
}

variable "activated_users" {
  type        = list(string)
  default     = []
  description = "The list of enabled access Users"
}