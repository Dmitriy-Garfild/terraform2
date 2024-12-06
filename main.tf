resource "yandex_vpc_network" "develop" {
  name = var.vm_web_vpc_name
}
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vm_web_vpc_name
  zone           = var.default_zone-a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}


resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vm_db_vpc_name
  zone           = var.default_zone-b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}



data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
resource "yandex_compute_instance" "platform-web" {
  name        = local.web      #"netology-develop-platform-web"
  platform_id = "standard-v3"  # исправлено название типа платформы
  zone = var.default_zone-a
  resources {
    cores         = var.vms_resources.web.cores  #2  исправлено допустимое значение для этого типа платформы
    memory        = var.vms_resources.web.memory        #1
    core_fraction = var.vms_resources.web.core_fraction      #20    исправлено выделяемые для вм процессорные мощности
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.vm.serial-port-enable #1
    ssh-keys           = var.vms_metadata.vm.ssh-keys #"ubuntu:${var.vms_ssh_root_key}"
  }

}


resource "yandex_compute_instance" "platform-bd" {
  name        = local.db       #"netology-develop-platform-db"
  platform_id = "standard-v3"  # исправлено название типа платформы
  zone = var.default_zone-b
  resources {
    cores         = var.vms_resources.db.cores   #2  #исправлено допустимое значение для этого типа платформы
    memory        = var.vms_resources.db.memory    #2
    core_fraction = var.vms_resources.db.core_fraction     #20  #  исправлено выделяемые для вм процессорные мощности
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.vm.serial-port-enable     #1
    ssh-keys           = var.vms_metadata.vm.ssh-keys    #"ubuntu:${var.vms_ssh_root_key}"
  }

}


