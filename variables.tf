variable "ami" {
  description = "our operating system"
  type        = string
}

variable "instance_type" {
  description = "type of instance"
  type        = string
}

variable "region" {
  description = "deploy region"
  type = string
}