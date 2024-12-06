output "test" {

  value = [
    { dev1 = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform-web.network_interface[0].nat_ip_address}",
    yandex_compute_instance.platform-web.name, yandex_compute_instance.platform-web.network_interface[0].nat_ip_address, yandex_compute_instance.platform-web.fqdn]},
    { dev2 = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform-bd.network_interface[0].nat_ip_address}", 
    yandex_compute_instance.platform-bd.name, yandex_compute_instance.platform-bd.network_interface[0].nat_ip_address, yandex_compute_instance.platform-bd.fqdn] },

  ]
}



