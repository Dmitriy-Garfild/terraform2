#это создано для составных переменных имени vm


variable "vm_common_part_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "same part of the name for all vm"
}

variable "vm_web_part_name" {
  type        = string
  default     = "web"
  description = "part of the name for vm web"
}
variable "vm_db_part_name" {
  type        = string
  default     = "db"
  description = "part of the name for vm db"
}

locals{
  web = "${var.vm_common_part_name}-${var.vm_web_part_name}" 
  db = "${var.vm_common_part_name}-${var.vm_db_part_name}"
}