

variable "vms_resources" {
  type = map(object({
    cores = number
    memory  = number
    core_fraction = number
    
  }))
  default = {
    "web" = {
    cores = 2
    memory  = 1
    core_fraction = 20
    },
    "db" = {
    cores = 2
    memory  = 2
    core_fraction = 20
    },
  }
}


variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    "vm" = {
    serial-port-enable = 1
    ssh-keys  = "ubuntu:ssh-ed25519 BJW10n8X1+1reUDhJKcSO "
    },
  }
}






