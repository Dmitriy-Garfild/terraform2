###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1g2mls7ihqtf2hcta91"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g2iei6n2ivj23lig04"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone-a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "develop-a"
  description = "VPC network & subnet name"
}


###ssh vars # закоментированно по заданию №6

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ubuntu:ssh-ed25519 n8X1+1reUDhJKcSO "
#  description = "ssh-keygen -t ed25519"
#}
