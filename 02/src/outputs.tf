output "virtual_machina" {
    value= [
        { vm_web = [
            "instance_name:${yandex_compute_instance.platform_web.name}", 
            "external_ip:${yandex_compute_instance.platform_web.network_interface[0].nat_ip_address}", 
            "fqdn:${yandex_compute_instance.platform_web.fqdn}"
            ]
        },
        { vm_db = [
            "instance_name: ${yandex_compute_instance.platform_db.name}", 
            "external_ip: ${yandex_compute_instance.platform_db.network_interface[0].nat_ip_address}", 
            "fqdn: ${yandex_compute_instance.platform_db.fqdn}"
            ]
        }
    ]
}
