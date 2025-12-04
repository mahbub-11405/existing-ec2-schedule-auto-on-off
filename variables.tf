variable "region" {
  default = "ap-southeast-1"
}

variable "instance_ids" {
  type = list(string)
}

variable "ec2_schedule_auto_on_off" {}