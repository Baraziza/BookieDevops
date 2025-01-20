variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "iam_role_arn" {
  type = string
}

variable "cluster_depends_on" {
  type    = any
  default = null
}