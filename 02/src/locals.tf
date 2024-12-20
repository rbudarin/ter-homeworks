locals {
    web_name = "${var.vm_web_platform_name}-${var.default_zone}"
    db_name  = "${var.vm_db_platform_name}-${var.default_zone_db}"
}
